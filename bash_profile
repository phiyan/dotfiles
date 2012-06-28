#!/bin/bash

# Additions to bash should be placed into ~/.bash_profile_includes with a .sh extension

for file in ~/.bash_profile_includes/*.sh; do
  [[ -r $file ]] && source $file;
done
