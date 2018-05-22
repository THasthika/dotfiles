export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim

export GOROOT="$HOME/.local/go"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/go" ] ; then
    PATH="$GOROOT/bin:$PATH"
fi

if [ -d "$HOME/Android/Sdk/platform-tools" ] ; then
    PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi
