#!/bin/bash
PWD=$PWD

ZSH_CUSTOM_DIR=~/.zsh-custom
VIM_DIR=$HOME/.vim
NEOVIM_DIR=$HOME/.config/nvim

dotfiles=()
os="macos"
ln_flags="-shf"

# Prepare for Linux
# -----------------------------------------------
prepare_linux() {
    echo "Preparing Linux"
    os="linux"
    ln_flags="-sT"
    dotfiles=(
        "tmux.conf"
        "spacemacs"
    )

    if command -v apt-get >/dev/null; then
        local apt_packages=(
            build-essential git curl
            zsh tmux xclip neovim
            git-delta icdiff             # git pager + difftool (gitconfig)
            silversearcher-ag ripgrep    # fzf/ack.vim, nvim-spectre
            universal-ctags              # tagbar
        )
        local missing=()
        for pkg in "${apt_packages[@]}"; do
            dpkg -s "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
        done
        if [ ${#missing[@]} -gt 0 ]; then
            echo "Installing ${missing[*]}"
            sudo apt-get update && sudo apt-get install -y "${missing[@]}"
        fi
    fi
}

# Prepare for macOS
# -----------------------------------------------
prepare_macos() {
    echo "Preparing macOS"
    dotfiles=(
        "slate"
        "tmux.conf"
        "spacemacs"
    )

    # Compilers, make, git
    if ! xcode-select -p >/dev/null 2>&1; then
        xcode-select --install
    fi

    if ! command -v brew >/dev/null; then
        echo "Homebrew not found, install it from https://brew.sh and rerun"
        exit 1
    fi

    local brew_packages=(
        git curl zsh tmux neovim
        git-delta icdiff
        the_silver_searcher ripgrep
        universal-ctags
    )
    local missing=()
    for pkg in "${brew_packages[@]}"; do
        brew list --formula "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
    done
    if [ ${#missing[@]} -gt 0 ]; then
        echo "Installing ${missing[*]}"
        brew install "${missing[@]}"
    fi
}

# Tools shared by both OSes
# -----------------------------------------------
install_tools() {
    # oh-my-zsh (sourced by zsh/zshrc). Cloned directly so its installer
    # doesn't overwrite the symlinked ~/.zshrc.
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
    fi

    # Make zsh the login shell
    local zsh_path
    zsh_path=$(command -v zsh)
    if [ -n "$zsh_path" ] && [ "$(basename "$SHELL")" != "zsh" ]; then
        grep -qx "$zsh_path" /etc/shells || echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
        chsh -s "$zsh_path"
    fi

    # Antidote (zsh plugin manager, used by zsh/plugins.zsh)
    local antidote_dir=$HOME/.antidote
    if [ ! -d "$antidote_dir" ]; then
        git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
    fi

    # nvm + latest LTS node
    local nvm_dir=$HOME/.nvm
    if [ ! -d "$nvm_dir" ]; then
        git clone https://github.com/nvm-sh/nvm.git "$nvm_dir"
        git -C "$nvm_dir" checkout "$(git -C "$nvm_dir" describe --abbrev=0 --tags)"
    fi
    (
        export NVM_DIR=$nvm_dir
        . "$NVM_DIR/nvm.sh"
        nvm install --lts
        nvm alias default 'lts/*'
    )

    # vim-plug (vim + neovim)
    for plug_path in "$VIM_DIR/autoload/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"; do
        if [ ! -f "$plug_path" ]; then
            curl -fLo "$plug_path" --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        fi
    done
}

if [[ $(uname) == "Linux" ]]; then
    prepare_linux
else
    prepare_macos
fi

install_tools

# OS Specific files
# -----------------------------------------------
echo "Creating links on $os"
for i in "${dotfiles[@]}"; do
    ln "$ln_flags" $PWD/$os/$i ~/.$i
done

# General files
# -----------------------------------------------
if [ ! -d $ZSH_CUSTOM_DIR ]; then
    ln "$ln_flags" $PWD/zsh/zsh-custom $ZSH_CUSTOM_DIR
fi

ln "$ln_flags" "$PWD/zsh" "$HOME/.zsh"
ln "$ln_flags" "$PWD/zsh/zshrc" "$HOME/.zshrc"
ln "$ln_flags" "$PWD/git/gitconfig" "$HOME/.gitconfig"
ln "$ln_flags" "$PWD/git/gitignore" "$HOME/.gitignore"

# Tmux
TMUX_DIR=$HOME/.tmux
mkdir -p "$TMUX_DIR"
ln "$ln_flags" "$PWD/tmux" "$TMUX_DIR/config"

# Vimrc
# -----------------------------------------------
mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$PWD/vimrc/config" "$VIM_DIR/config"
ln "$ln_flags" "$PWD/vimrc/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$PWD/vimrc/vimrc" ~/.neovimrc
ln "$ln_flags" "$PWD/vimrc/vimrc" ~/.vimrc
ln "$ln_flags" "$PWD/vimrc/ideavimrc" ~/.ideavimrc
ln "$ln_flags" "$PWD/vimrc/xvimrc" ~/.xvimrc
ln "$ln_flags" "$PWD/alacritty.toml" ~/.alacritty.toml

# Hammerspoon
HAMMERSPOON_DIR=$HOME/.hammerspoon
mkdir -p $HAMMERSPOON_DIR
ln "$ln_flags" "$PWD/$os/hammerspoon.lua" "$HAMMERSPOON_DIR/init.lua"
