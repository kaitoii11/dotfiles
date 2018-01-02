PATH=$PATH:/opt/local/bin

# no duplicate line or line with spaces in history
HISTCONTROL=ignoreboth

#append to history file
shopt -s histappend

# history length
HISTSIZE=100000
HISTFILESIZE=2000

#update values of LINES and COLUMNS
shopt -s checkwinsize

export EDITOR=vim

# pyenv setting
if [[ -x "$(command -v pyenv)" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [ -e /usr/bin/xsel ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias tmux-copy='tmux save-buffer - | pbcopy'
fi


#alias
alias gcc='gcc -Wall -g'
alias ls='ls -FG'
alias grep='grep --color=always'
if [[ -x $(command -v del) ]]; then
alias rm='del'
fi
if [[ -x "$(command -v colordiff)" ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
#vim
if [[ -e /opt/local/bin/vim ]]; then
  alias vim='/opt/local/bin/vim'
  alias vi='/opt/local/bin/vim'
  alias v='/opt/local/bin/vim'
else
  alias vim='/usr/bin/vim'
  alias vi='/usr/bin/vim'
  alias v='/usr/bin/vim'
fi

if [[ -e /usr/bin/virtualenvwrapper.sh ]]; then
  source /usr/bin/virtualenvwrapper.sh
  export WORKON_HOME=~/.virtualenvs
fi
