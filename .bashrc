##
# Ubuntu Defaults (customized)
#

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Set history length.
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Load bash_aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load bash_completion.
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


##
# Prompt Customization
#

# Regular
NO_COLOR=$(echo -en '\033[00m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')

# Bold
BOLD_RED=$(echo -en '\033[31;01m')
BOLD_GREEN=$(echo -en '\033[32;01m')
BOLD_YELLOW=$(echo -en '\033[33;01m')
BOLD_BLUE=$(echo -en '\033[34;01m')
BOLD_PURPLE=$(echo -en '\033[35;01m')
BOLD_CYAN=$(echo -en '\033[36;01m')

# Git Bash
if [ -f ~/.gitprompt ]; then
    . ~/.gitprompt
fi

# Git Completion
if [ -f ~/.gitcompletion ]; then
    . ~/.gitcompletion
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose name"
export GIT_PS1_DESCRIBE_STYLE="default"
export GIT_PS1_SHOWCOLORHINTS=true

PROMPT_COMMAND=set_bash_prompt

# Set the bash prompt output and color
function set_bash_prompt() {
    PS1="$(get_venv_name_with_color)${BOLD_CYAN}\u${NO_COLOR}@${BOLD_GREEN}\h${NO_COLOR}:${BOLD_YELLOW}\w${BOLD_RED}$(__git_ps1 " (%s)")${NO_COLOR}\n[\t] $ "
}

# Set the virtual environment name and color
function get_venv_name_with_color() {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        echo "${BOLD_PURPLE}(${VIRTUAL_ENV##*/})${NO_COLOR} "
    fi
}

# rbenv
if [ -d ~/.rbenv ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# nodenv
if [ -d ~/.nodenv ]; then
	export PATH="$HOME/.nodenv/bin:$PATH"
fi

