# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Source config
source ~/.zenv
source ~/.zaliases

# Completions (cached, rebuilds daily)
autoload -Uz compinit
fpath=(~/.zsh/completions $fpath)
if [[ -z ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Init tools
eval "$(starship init zsh)"
eval "$(uv generate-shell-completion zsh)"
