# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# We use preexec and precmd hook functions for Bash
# If you have anything that's using the Debug Trap or PROMPT_COMMAND 
# change it to use preexec or precmd
# See also https://github.com/rcaloras/bash-preexec

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

alias config='/usr/bin/git --git-dir=/home/tharindu/.cfg/ --work-tree=/home/tharindu'

## CUSTOM PROMPT

function my_prompt_parse_git_branch() {
	local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
	if [[ -n $branch ]]; then
		echo " $branch"
	fi
}

function my_prompt() {
    local COLOR_GREY="\[\e[30;1m\]"
    local COLOR_RED="\[\e[31;1m\]"
    local COLOR_BLUE="\[\e[34;1m\]"
    local COLOR_GREEN="\[\e[32;1m\]"
    local COLOR_RESET="\[\e[0m\]"

    local username=$(whoami)

    local PROMPT_USER="${COLOR_BLUE}(\u@\h)"
    local PROMPT_PWD="${COLOR_GREEN}\W"
    local PROMPT_SYMBOL="${COLOR_GREY}$"

    if [[ $HOSTNAME -eq "tharindu-lap" ]]; then
	PROMPT_USER="${COLOR_BLUE}(\u)"
    fi

    if [[ $EUID -eq 0 ]]; then
	PROMPT_SYMBOL="${COLOR_RED}#"
    fi

    if [[ $username -eq "tharindu" ]]; then
	PROMPT_USER=""
    fi

    PS1="${PROMPT_USER}${PROMPT_PWD}"
    PS1+="${COLOR_BLUE}"
    PS1+='$(my_prompt_parse_git_branch)'
    PS1+=" ${PROMPT_SYMBOL}${COLOR_RESET} "
}

if [[ $TERM == "screen" ]] || [[ $TERM == "screen-256color" ]] || [[ $TERM == "xterm-256color" ]] || [[ $TERM == "rxvt-unicode-256color" ]]; then
	my_prompt
fi
