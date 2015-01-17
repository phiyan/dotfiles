#!/bin/bash

alias o='open'
alias ll="ls -lAh"
alias grep='grep -H -n'

alias stop='kill -2'
alias shutupvim="rm ~/.vim/.tmp/*.sw*"
alias mvimplain="mvim -u NONE"

alias gemdoc='gem environment gemdir'/doc
alias untar="tar -xvf"
alias rtags="find . -name '*.rb' | xargs /usr/bin/ctags -R -a -f tags"
alias rgem="rvm gemset"

alias chrome="unsafe_chrome"

alias be="bundle exec"
alias gobj="gcc -framework foundation"
alias clangobj="clang -framework foundation"

alias gitchanges="git st -s | sed 's/^...//g'"
alias gitchangesspec='git st -s | cut -c 4- | ack spec | ack -v ".*(stubs|factories).*"'
alias ag="ag -i"
alias tmigrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias rtest="ruby -Itest"
