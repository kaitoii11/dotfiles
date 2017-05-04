PATH=$PATH:/opt/local/bin

# no duplicate line or line with spaces in history
HISTCONTROL=ignoreboth

#append to history file
shopt -s histappend

# history length
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR=vim

# pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
