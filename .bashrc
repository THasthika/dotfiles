#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

complete -cf sudo

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
