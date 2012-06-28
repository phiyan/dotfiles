#!/bin/bash

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
