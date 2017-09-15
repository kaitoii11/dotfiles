# from https://github.com/funasoul/dotfiles/blob/master/.bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

### colors
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
purple="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"
reset="\[$(tput sgr0)\]"

### prompt
function prompt() {
  # Most part of this implementation is taken from: https://superuser.com/questions/187455/right-align-part-of-prompt/1203400#1203400
  if [ $? != 0 ]; then
    PS1="${reset}\u[${red}\h${reset}] "
  else
    PS1="${reset}\u[${cyan}\h${reset}] "
  fi
  # Create a string like:  "[ ~/Downloads ]" with $PWD in GREEN
  mydir=$(echo $PWD | sed -e "s,^$HOME,~,")
  printf -v PS1RHS "\e[0m[ \e[0;1;32m$mydir \e[0m]"

  # Strip ANSI commands before counting length
  # From: https://www.commandlinefu.com/commands/view/12043/remove-color-special-escape-ansi-codes-from-text-with-sed
  PS1RHS_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"$PS1RHS")

  # Reference: https://en.wikipedia.org/wiki/ANSI_escape_code
  local Save='\e[s' # Save cursor position
  local Rest='\e[u' # Restore cursor to save point

  # Save cursor position, jump to right hand edge, then go left N columns where
  # N is the length of the printable RHS string. Print the RHS string, then
  # return to the saved position and print the LHS prompt.

  # Note: "\[" and "\]" are used so that bash can calculate the number of
  # printed characters so that the prompt doesn't do strange things when
  # editing the entered text.

  PS1="\[${Save}\e[${COLUMNS}C\e[${#PS1RHS_stripped}D${PS1RHS}${Rest}\]${PS1}"
}

PROMPT_COMMAND=prompt

# script ${log_archive_directory}/$(date +%Y%m%d_%H%M%S)_$(whoami).log
