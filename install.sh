#!/bin/bash
PWD=$PWD

ZSH_CUSTOM_DIR=~/.zsh-custom

dotfiles=()
os="macos"
ln_flags="-shf"

# OS Specific files
# -----------------------------------------------
if [[ $(uname) == "Linux" ]]; then
    echo "Creating links on Linux"
    os="linux"
    ln_flags="-sT"
    dotfiles=(
        "tmux.conf"
        "spacemacs"
    )
else
    echo "Creating links on macOS"
    dotfiles=(
        "slate"
        "tmux.conf"
        "spacemacs"
    )
fi

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
NEOVIM_DIR=$HOME/.config/nvim
VIM_DIR=$HOME/.vim
mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$PWD/vimrc/config" "$VIM_DIR/config"
ln "$ln_flags" "$PWD/vimrc/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$PWD/vimrc/vimrc" ~/.neovimrc
ln "$ln_flags" "$PWD/vimrc/vimrc" ~/.vimrc
ln "$ln_flags" "$PWD/vimrc/ideavimrc" ~/.ideavimrc
ln "$ln_flags" "$PWD/vimrc/xvimrc" ~/.xvimrc
ln "$ln_flags" "$PWD/alacritty.yml" ~/.alacritty.yml
ln "$ln_flags" "$PWD/vimrc/coc-settings.json" $NEOVIM_DIR/coc-settings.json
ln "$ln_flags" "$PWD/vimrc/config/ultisnips" ~/.config/coc/ultisnips

# Hammerspoon
HAMMERSPOON_DIR=$HOME/.hammerspoon
mkdir -p $HAMMERSPOON_DIR
ln "$ln_flags" "$PWD/$os/hammerspoon.lua" "$HAMMERSPOON_DIR/init.lua"
