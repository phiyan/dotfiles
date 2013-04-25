# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git rails ruby brew git-extras)

source $ZSH/oh-my-zsh.sh

setopt autopushd
unsetopt correct_all
unsetopt share_history

# Customize to your needs...
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/bin:$PATH

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

source ~/.zshrc_includes/infogroup.sh
