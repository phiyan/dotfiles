#!/bin/bash

export TERM=xterm-color
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
# export LSCOLORS=Exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme
export HISTCONTROL=ignoredups
export EDITOR=mvim

# Readline, the line editing library that bash uses, does not know
# that the terminal escape sequences do not take up space on the
# screen. The redisplay code assumes, unless told otherwise, that
# each character in the prompt is a `printable' character that
# takes up one character position on the screen. 

# You can use the bash prompt expansion facility (see the PROMPTING
# section in the manual page) to tell readline that sequences of
# characters in the prompt strings take up no screen space. 

# Use the \[ escape to begin a sequence of non-printing characters,
# and the \] escape to signal the end of such a sequence.
# EG: GREEN="\[\e[0;32m\]" 

# Define some colors first:
RED='\[\e[1;31m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[32m\]'
NC='\[\e[0m\]' # No Color

# PS1="${CUSTOMCOLORMIX}\\u@\h: \\W]\\$ ${NC}"
PS1="${DARKCUSTOMCOLORMIX}\\u@\h: \\W ${BLUE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

list_detailed_more()
{
	ls -lah $1 | more
}

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

alias o='open'
alias lm="list_detailed_more"
alias ll="ls -lAh"
alias cll="clear; ls -lAh"
#alias cd='pushd'
alias trash='safe_rm'
# alias rm='rm -i'
alias grep='grep -H -n'
alias pcurl='curl --proxy localhost:8888'

alias stop='kill -2'
alias sassw='sass --watch'
alias sassdefault='sass --watch stylesheets/sass:stylesheets/compiled'
alias coffeed='coffee --nodejs --debug'
alias coffeedefault='coffee -lo javascripts/ -w coffeescripts/ &'

alias home="cd ~; clear; ls -lAh"
alias gemdoc='gem environment gemdir'/doc
alias gemuninstallall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias untar="tar -xvf"
alias rtags="find . -name '*.rb' | xargs /usr/bin/ctags -R -a -f TAGS"

alias mongod="mongod --dbpath ~/data/db"
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# alias hibernate="sudo pmset -a hibernatemode 5; sudo shutdown -s now && sudo pmset -a hibernatemode 3"

alias borr="cd ~/Repos/git/beyonceorrihanna"

# bash git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export PATH=./node_modules/.bin:~/bin:/usr/local/bin:$PATH

# MacPorts Installer addition on 2011-07-16_at_10:07:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/usr/local/lib/jsctags/:$PATH
