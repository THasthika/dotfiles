# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

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
    local PROMPT_SYMBOL="${COLOR_BLUE}$"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tharindu/google-cloud-sdk/path.bash.inc' ]; then source '/home/tharindu/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tharindu/google-cloud-sdk/completion.bash.inc' ]; then source '/home/tharindu/google-cloud-sdk/completion.bash.inc'; fi
