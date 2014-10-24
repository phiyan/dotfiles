#!/bin/bash

unsafe_chrome()
{
  open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1 --args --allow-file-access-from-files
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

set_go_workspace() {
  export GOPATH=`pwd`
  export PATH=$PATH:$GOPATH/bin
}

docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh sudo /var/lib/boot2docker/docker-enter "$@"
}
