#!/bin/bash

unsafe_chrome()
{
  open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1 --args --allow-file-access-from-files
}
export -f unsafe_chrome

list_detailed_more()
{
  ls -lah $1 | more
}
export -f list_detailed_more

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
export -f parse_svn_branch

parse_svn_url() {
  svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
export -f parse_svn_url

parse_svn_repository_root() {
  svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}
export -f parse_svn_repository_root

# Safe rm procedure
safe_rm()
{
  # Cycle through each argument for deletion
  for file in $*; do
    if [ -e $file ]; then

      # Target exists and can be moved to Trash safely
      if [ ! -e ~/.Trash/$file ]; then
        mv $file ~/.Trash

        # Target exists and conflicts with target in Trash
      elif [ -e ~/.Trash/$file ]; then

        # Increment target name until 
        # there is no longer a conflict
        i=1
        while [ -e ~/.Trash/$file.$i ];
        do
          i=$(($i + 1))
        done

        # Move to the Trash with non-conflicting name
        mv $file ~/.Trash/$file.$i
      fi

      # Target doesn't exist, return error
    else
      echo "rm: $file: No such file or directory";
    fi
  done
}
export -f safe_rm
