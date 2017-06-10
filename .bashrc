PATH=$PATH:/opt/local/bin

# no duplicate line or line with spaces in history
HISTCONTROL=ignoreboth

#append to history file
shopt -s histappend

# history length
HISTSIZE=100000
HISTFILESIZE=2000

#update values of LINES and COLUMNS
shopt -s checkwinseize

export EDITOR=vim

# pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -e /usr/bin/xsel ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
  alias tmux-copy='tmux save-buffer - | pbcopy'
fi


#alias
alias gcc='gcc -Wall -g'
alias ls='ls -FG'
alias grep='grep --color=always'
alias rm='del'
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
#emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
#vim
if [ -e /opt/local/bin/vim  ]; then
  alias vim='/opt/local/bin/vim'
  alias vi='/opt/local/bin/vim'
  alias v='/opt/local/bin/vim'
else
  alias vim='/usr/bin/vim'
  alias vi='/usr/bin/vim'
  alias v='/usr/bin/vim'
fi
