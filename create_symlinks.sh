#!/bin/bash

dotfiles=( bash_profile bash_profile_includes gitconfig gitignore gituserconfig )
source=$(pwd)

for dotfile in "${dotfiles[@]}"; do
  mv "${HOME}/.${dotfile}" "${HOME}/${dotfile}.bak"
  echo "linking ${source}/${dotfile} to ${HOME}/.${dotfile}"
  ln -s "${source}/${dotfile}" "${HOME}/.${dotfile}"
done
