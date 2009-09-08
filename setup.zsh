#!/usr/bin/env zsh

files="zshrc zshenv vimrc gvimrc screenrc gitconfig vim"
for filename in ${(z)files}; do
  echo "create symlink from" "$PWD/$filename" "to" "$HOME/.$filename"
  ln -s "$PWD/$filename" "$HOME/.$filename"
done
