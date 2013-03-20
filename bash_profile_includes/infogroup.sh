#!/bin/bash

export PATH=/usr/local/bin::/usr/local/sbin:$PATH
export ARCHFLAGS="-arch x86_64"

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

alias gqa="source ~/.aws/accounts/gotime_qa/rc"
#alias gprod="source ~/.aws/accounts/gotime_prod/rc"
#alias vqa="source ~/.aws/accounts/vvm_qa/rc"
#alias vprod="source ~/.aws/accounts/vvm_prod/rc"

source ~/.aws/accounts/gotime_qa/rc
source ~/.chef/.chef_aliases
