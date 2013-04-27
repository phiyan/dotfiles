#!/bin/sh

dotfiles=( zshrc ackrc bash_profile bash_profile_includes gitconfig inputrc irbrc rdebugrc )
source=$1

if [ -z $source ]; then
  echo "Must pass the directory where the dotfiles live"
  exit 1
fi

for dotfile in "${dotfiles[@]}"; do
  rm -f ".${dotfile}"
  ln -s "${source}/${dotfile}" ".${dotfile}"
done
