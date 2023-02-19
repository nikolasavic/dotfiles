# Emacs keybindings
bindkey -e

# Zsh completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Alias
source $HOME/.config/alias/navigation
source $HOME/.config/alias/git
source $HOME/.config/alias/fzf
source $HOME/.config/alias/spark

# Starship Prompt
eval "$(starship init zsh)"
