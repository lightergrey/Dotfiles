#!/bin/zsh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
setopt correctall auto_cd

# Vim mode
bindkey -v

export EDITOR="vim"
export AUTOSSH_GATETIME=0
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# Prompt setup
autoload -U promptinit; promptinit
prompt pure

# Completion
autoload -U compinit; compinit

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Git functions
source ~/.zsh/fzf-git.zsh

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' forward-word
bindkey '^E' autosuggest-execute

# Syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
