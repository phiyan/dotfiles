#!/bin/bash

alias o='open'
alias lm="list_detailed_more"
alias ll="ls -lAh"
alias cll="clear; ls -lAh"
#alias cd='pushd'
alias trash='safe_rm'
# alias rm='rm -i'
alias grep='grep -H -n'
alias pcurl='curl --proxy localhost:8888'
alias rmquarantine='xattr -d com.apple.quarantine'

alias stop='kill -2'
alias sassw='sass --watch'
alias sassdefault='sass --watch stylesheets/sass:stylesheets/compiled'
alias coffeed='coffee --nodejs --debug'
alias coffeedefault='coffee -lo javascripts/ -w coffeescripts/ &'
alias shutupvim="rm /var/tmp/*.sw*"

alias home="cd ~; clear; ls -lAh"
alias gemdoc='gem environment gemdir'/doc
alias gemuninstallall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias untar="tar -xvf"
alias rtags="find . -name '*.rb' | xargs /usr/bin/ctags -R -a -f tags"
alias rgem="rvm gemset"

# alias mongod="mongod --dbpath ~/data/db"
alias chrome="unsafe_chrome"

# alias hibernate="sudo pmset -a hibernatemode 5; sudo shutdown -s now && sudo pmset -a hibernatemode 3"

alias be="bundle exec"
alias borr="cd ~/workspace/beyonceorrihanna"
alias rd="cd ~/workspace/revealdown"
alias current="cd ~/workspace/new-block-city"
alias gitchanges="git st -s | sed 's/^...//g'"
alias gobj="gcc -framework foundation"
alias clangobj="clang -framework foundation"
