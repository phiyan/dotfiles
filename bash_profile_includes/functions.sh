#!/bin/bash

unsafe_chrome()
{
  open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1 --args --allow-file-access-from-files
}
export -f unsafe_chrome

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

set_go_workspace() {
  export GOPATH=`pwd`
  export PATH=$PATH:$GOPATH/bin
}
export -f set_go_workspace

docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh sudo /var/lib/boot2docker/docker-enter "$@"
}
