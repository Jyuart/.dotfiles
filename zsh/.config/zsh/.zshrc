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

# History configuration
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Some key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit

# Other files
source $ZDOTDIR/aliases

# Plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source $ZDOTDIR/plugins/zsh-completions/zsh-completions.plugin.zsh

# Languages & tooling
FNM_PATH="/home/jyuart/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jyuart/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/lua-language-server/bin:$PATH"

# Shell integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# SSH
if ! pgrep -u $USER ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi
ssh-add ~/.ssh/id_ed25519 2>/dev/null
