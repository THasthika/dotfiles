#
# ~/.bash_profile
#

export PATH="$PATH:$HOME/.local/bin/"

export GOPATH="$HOME/go/:$HOME/mygo/"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
