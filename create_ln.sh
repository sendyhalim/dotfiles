#!/bin/bash
PWD=$(pwd)
ZSH_CUSTOM_DIR=~/.zsh-custom

if [[ $(uname) == "Linux" ]]; then
  echo "Creating links on Linux"
  ln -s $PWD/linux/tmux.conf ~/.tmux.conf
else
  echo "Creating links on OSX"
  ln -s $PWD/osx/slate ~/.slate
  ln -s $PWD/osx/tmux.conf ~/.tmux.conf
  ln -s $PWD/osx/zshrc ~/.zshrc
fi

if [ ! -d $ZSH_CUSTOM_DIR ]; then
  ln -s $PWD/zsh-custom $ZSH_CUSTOM_DIR
fi

ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/gitconfig ~/.gitconfig
