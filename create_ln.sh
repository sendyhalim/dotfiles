#!/bin/bash
PWD=$(pwd)
OS_DIR=osx

ZSH_CUSTOM_DIR=~/.zsh-custom

dotfiles=()
os="osx"

# OS Specific files
# ------------------------------------------------------------------------------
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
# ------------------------------------------------------------------------------
if [ ! -d $ZSH_CUSTOM_DIR ]; then
    ln -s $PWD/$OS_DIR/zsh-custom $ZSH_CUSTOM_DIR
fi

general_dotfiles=(
    "gitignore"
    "gitconfig"
    "zshrc"
)

for i in "${general_dotfiles[@]}"; do
    ln -s $PWD/$i ~/.$i
done
