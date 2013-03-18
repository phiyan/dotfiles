# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

setopt autopushd

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby brew git-extras)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme
export PATH=/Users/dimitrib/.rvm/gems/ruby-2.0.0-p0/bin:/Users/dimitrib/.rvm/gems/ruby-2.0.0-p0@global/bin:/Users/dimitrib/.rvm/rubies/ruby-2.0.0-p0/bin:/Users/dimitrib/.rvm/bin:/usr/local/share/python:/Users/dimitrib/bin:/usr/local/bin:/usr/local/lib/jsctags:/usr/local/share/npm/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

alias o='open'
alias lm="list_detailed_more"
alias ll="ls -lAh"
alias cll="clear; ls -lAh"
alias grep='grep -H -n'
alias pcurl='curl --proxy localhost:8888'
alias rmquarantine='xattr -d com.apple.quarantine'
alias stop='kill -2'
alias shutupvim="rm /var/tmp/*.sw*"
alias gemdoc='gem environment gemdir'/doc
alias gemuninstallall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias untar="tar -xvf"
alias be="bundle exec"
