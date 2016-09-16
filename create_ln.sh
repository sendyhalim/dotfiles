#!/bin/bash
PWD=$(pwd)
OS_DIR=osx

ZSH_CUSTOM_DIR=~/.zsh-custom

dotfiles=()
os="osx"

# OS Specific files
# -----------------------------------------------
if [[ $(uname) == "Linux" ]]; then
    echo "Creating links on Linux"
    os="linux"
    dotfiles=(
        "tmux.conf"
        "spacemacs"
    )
else
    echo "Creating links on OSX"
    dotfiles=(
        "slate"
        "tmux.conf"
        "spacemacs"
    )
fi

for i in "${dotfiles[@]}"; do
    rm ~/.$i
    ln -s $PWD/$os/$i ~/.$i
done

# General files
# -----------------------------------------------
if [ ! -d $ZSH_CUSTOM_DIR ]; then
    ln -sh $PWD/$OS_DIR/zsh-custom $ZSH_CUSTOM_DIR
fi

general_dotfiles=(
    "gitignore"
    "gitconfig"
    "zshrc"
)

for i in "${general_dotfiles[@]}"; do
    rm ~/.$i
    ln -sh $PWD/$i ~/.$i
done

# Vimrc
# -----------------------------------------------
NEOVIM_DIR=$HOME/.config/nvim
VIM_DIR=$HOME/.vim
mkdir -p "$VIM_DIR"

ln -sh "$VIM_DIR" "$NEOVIM_DIR"
ln -sh "$(pwd)/vimrc/config" "$VIM_DIR/config"
ln -sh "$(pwd)/vimrc/vimrc" "$NEOVIM_DIR/init.vim"
ln -sh "$(pwd)/vimrc/vimrc" ~/.neovimrc
ln -sh "$(pwd)/vimrc/vimrc" ~/.vimrc
ln -sh "$(pwd)/vimrc/ideavimrc" ~/.ideavimrc
ln -sh "$(pwd)/vimrc/xvimrc" ~/.xvimrc
