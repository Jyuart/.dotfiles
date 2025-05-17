# Prompt
PROMPT='%F{cyan}%2~%f $ '

# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $ZDOTDIR/aliases

# fnm node
FNM_PATH="/home/jyuart/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jyuart/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# cargo rust
export PATH="$HOME/.cargo/bin:$PATH"
