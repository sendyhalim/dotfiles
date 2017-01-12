#!/bin/bash
PWD=$(pwd)

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
    ln "$ln_flags" $PWD/$os/zsh-custom $ZSH_CUSTOM_DIR
fi

general_dotfiles=(
    "gitignore"
    "gitconfig"
    "zshrc"
    "aliases"
)

for i in "${general_dotfiles[@]}"; do
    ln "$ln_flags" $PWD/$i ~/.$i
done

# Vimrc
# -----------------------------------------------
NEOVIM_DIR=$HOME/.config/nvim
VIM_DIR=$HOME/.vim
mkdir -p "$VIM_DIR"

ln "$ln_flags" "$VIM_DIR" "$NEOVIM_DIR"
ln "$ln_flags" "$(pwd)/vimrc/config" "$VIM_DIR/config"
ln "$ln_flags" "$(pwd)/vimrc/vimrc" "$NEOVIM_DIR/init.vim"
ln "$ln_flags" "$(pwd)/vimrc/vimrc" ~/.neovimrc
ln "$ln_flags" "$(pwd)/vimrc/vimrc" ~/.vimrc
ln "$ln_flags" "$(pwd)/vimrc/ideavimrc" ~/.ideavimrc
ln "$ln_flags" "$(pwd)/vimrc/xvimrc" ~/.xvimrc
