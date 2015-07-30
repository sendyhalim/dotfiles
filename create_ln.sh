#!/bin/bash
PWD=$(pwd)

ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/gitconfig ~/.gitconfig

if [[ $(uname) == "Linux" ]]; then
  echo "Creating links on Linux"
  ln -s $PWD/linux/tmux.conf ~/.tmux.conf
else
  echo "Creating links on OSX"
  ln -s $PWD/osx/slate ~/.slate
  ln -s $PWD/osx/tmux.conf ~/.tmux.conf
fi
