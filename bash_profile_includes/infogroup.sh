#!/bin/bash

export PATH=/usr/local/bin::/usr/local/sbin:$PATH
export ARCHFLAGS="-arch x86_64"

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_RDS_HOME="/usr/local/Cellar/rds-command-line-tools/1.10.003/libexec"

alias gqa="source ~/.aws/accounts/gotime_qa/rc"
alias gprod="source ~/.aws/accounts/gotime_prod/rc"
#alias vqa="source ~/.aws/accounts/vvm_qa/rc"
#alias vprod="source ~/.aws/accounts/vvm_prod/rc"

function emrpk {
  scp -o StrictHostKeyChecking=no $(dirname ${EC2_PRIVATE_KEY})/emr_shared.pem hadoop@${1}:pk.pem
}

function emrssh {
  ssh -L 9100:localhost:9100 -L 11000:localhost:11000 -o ServerAliveInterval=10 -o StrictHostKeyChecking=no -i ${EC2_PRIVATE_KEY} hadoop@${1}
}

source ~/.aws/accounts/gotime_qa/rc
source ~/.chef/.chef_aliases
