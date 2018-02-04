#
# ~/.bashrc
#


# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

complete -cf sudo

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function custom01 {
    local COLOR_GREY="\[\e[30;1m\]"
    local COLOR_RED="\[\e[31;1m\]"
    local COLOR_BLUE="\[\e[34;1m\]"
    local COLOR_GREEN="\[\e[32;1m\]"
    local COLOR_RESET="\[\e[0m\]"

    local COLOR_USER_AND_HOST="${COLOR_BLUE}"
    local PROMPT_SYMBOL="$"

    if [[ $EUID -eq 0 ]]; then
        COLOR_USER_AND_HOST="${COLOR_RED}"
	PROMPT_SYMBOL="#"
    fi

    PS1="${COLOR_GREY}("
    PS1+="${COLOR_USER_AND_HOST}\u@\h"
    PS1+="${COLOR_GREY})"
    PS1+=" ${COLOR_GREEN}\w"
    PS1+="${COLOR_BLUE}"
    PS1+=' $(parse_git_branch)'
    PS1+=" ${COLOR_GREY}${PROMPT_SYMBOL} "
    PS1+="${COLOR_RESET}"
}

if [[ $TERM == "screen-256color" ]]; then
	custom01
fi

alias config='/usr/bin/git --git-dir=/home/tharindu/.cfg/ --work-tree=/home/tharindu'

if [[ $TERM ==  "rxvt-unicode-256color" ]]; then
	exec tmux
fi
