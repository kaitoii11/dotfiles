# Path to your oh-my-zsh installation.
export ZSH=$ZDOTDIR/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#alias
source $ZDOTDIR/.zshaliases

#USER zshrc
AVEHIST=100000
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=100000

#####prompt edit
PS1='%F{cyan}%m%f:> '
RPS1='[%~/%t]'

##case insensitive autocomplete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#ignore logout when C-d
setopt IGNORE_EOF
#neglect same command fromm saving history
setopt HIST_IGNORE_DUPS
##share history
setopt SHARE_HISTORY
#reduce blank from history
setopt HIST_REDUCE_BLANKS
#exclude history from saving in zhistory
setopt HIST_NO_STORE
#exclude command starts from blank space from saving in zhistory
setopt HIST_IGNORE_SPACE
#notify background jobs
setopt NOTIFY
#auto-cd
setopt AUTOCD
#noclobber
setopt NOCLOBBER
#ad / to directory 
setopt auto_param_slash

#C-w
WORDCHARS="*?_-.[]~=&;\!#$%^(){}<>"

#DIESTACKSIZE
DIRSTACKSIZE=10
#fignore
fignore=(.o \~)
#LISTMAX
LISTMAX=0
#READNULLCMD
READNULLCMD='less'

#keybind
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#autoload functions
fpath=($ZDOTDIR/.func $fpath)
autoload ${fpath[1]}/*(:t)

#rupa/z
_Z_CMD=j
source $ZDOTDIR/z/z.sh

