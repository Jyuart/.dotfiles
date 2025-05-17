# Should be the default
export XDG_CONFIG_HOME="$HOME/.config"

# To get rid of all the zsh config files in home dir
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# To get rid of les hist file (can be just moved if needed)
export LESSHISTFILE=-

# Editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Go installation
export GOPATH=$HOME/.local/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
