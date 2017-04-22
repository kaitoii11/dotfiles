PATH=$PATH:/opt/local/bin

# no duplicate line or line with spaces in history
HISTCONTROL=ignoreboth

#append to history file
shopt -s histappend

# history length
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR=vim
