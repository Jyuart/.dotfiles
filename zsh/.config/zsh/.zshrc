# Load git info into zsh
autoload -Uz vcs_info
precmd() {
	vcs_info
}
# The way it's gonna look
zstyle ':vcs_info:git*' formats '%F{magenta}[%b]%f'

# Prompt
# This option is needed to expand some variables
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f ${vcs_info_msg_0_} %F{yellow}❯%f '

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

# Other files
source $ZDOTDIR/aliases

# Plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
alias ll='ls -lah'
source $ZDOTDIR/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# fnm node
FNM_PATH="/home/jyuart/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jyuart/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# cargo rust
export PATH="$HOME/.cargo/bin:$PATH"
