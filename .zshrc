 # Path to your oh-my-zsh installation.
 export ZSH=$ZDOTDIR/.oh-my-zsh

# Set name of the  to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example a
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive c]ompletion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

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
plugins=(git colorize battery)

fpath=($ZDOTDIR/.func /opt/local/share/zsh/5.1.1/functions/ $fpath)
autoload ${fpath[1]}/*(:t)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
#export MANPATH="/usr/local/man:$MANPATH"

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
SAVEHIST=100000
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=100000

#####prompt edit
if [ "$USER" = "root" ]
then
  pc=$RED
else
  pc=cyan
fi

#zsh-completions
if [ -e /opt/local/var/macports/software/zsh-completions ]; then
  fpath=(/opt/local/var/macports/software/zsh-completions $fpath)
fi

#autoload functions
zle -N peco-tree-vim
bindkey "^t" peco-tree-vim

##case insensitive autocomplete
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2
##zmv
autoload -U zmv

#ignore logout when C-d
setopt IGNORE_EOF
#neglect same command fromm saving history
setopt HIST_IGNORE_DUPS
#share history
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
#add / to directory
setopt auto_param_slash
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
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

#prompt
local p_mark="%(?,%F{green},%F{red})%(!.#.>)%f"
local p_name="%F{${pc}}%m%f"
PS1='${p_name}:${p_mark} '
RPS1='[%~ %F{red}%t%f $(parse_git_branch)]'

#keybind
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
if [ -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export LESS=' -N -R'
export LESSOPEN="export LESSOPEN='|lessfilter.sh %s'"

export FPATH="/opt/local/share/zsh/site-functions/:$FPATH "
if [ -f /opt/local/etc/profile.d/autojump.zsh ]; then
  . /opt/local/etc/profile.d/autojump.zsh
fi

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

function peco-select-history() {
local tac
if which tac > /dev/null; then
  tac="tac"
else
  tac="tail -r"
fi
BUFFER=$(\history -n 1 | \
  eval $tac | \
  peco --query "$LBUFFER")
CURSOR=$#BUFFER
zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#zshrc zcompile
if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
  zcompile $ZDOTDIR/.zshrc
fi

watch=(not me)\

  # tmux auto start
is_screen_running() {
  # tscreen also uses this varariable.
  [ ! -z "$WINDOW" ]
}
is_tmux_runnning() {
  [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
  is_screen_running || is_tmux_runnning
}
shell_has_started_interactively() {
  [ ! -z "$PS1" ]
}
resolve_alias() {
  cmd="$1"
  while \
    whence "$cmd" >/dev/null 2>/dev/null \
    && [ "$(whence "$cmd")" != "$cmd" ]
do
  cmd=$(whence "$cmd")
done
echo "$cmd"
}

if ! is_screen_or_tmux_running && shell_has_started_interactively; then
  for cmd in tmux tscreen screen; do
    if whence $cmd >/dev/null 2>/dev/null; then
      $(resolve_alias "$cmd")
      break
    fi
  done
fi
