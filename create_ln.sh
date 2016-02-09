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
        "zshrc"
        "spacemacs"
    )
else
    echo "Creating links on OSX"
    dotfiles=(
        "slate"
        "tmux.conf"
        "zshrc"
        "spacemacs"
    )
fi

for i in "${dotfiles[@]}"; do
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
)

for i in "${general_dotfiles[@]}"; do
    ln -s $PWD/$i ~/.$i
done
