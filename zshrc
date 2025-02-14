#!/bin/zsh

setopt auto_cd
bindkey -v # Vim mode

export EDITOR="vim"
export LC_ALL=en_US.UTF-8
export PATH=$HOME/opt/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH

# Completion
unsetopt correct_all
autoload -U compinit; compinit
source ~/development/Dotfiles/submodules/fzf-tab/fzf-tab.plugin.zsh

# History
setopt hist_ignore_all_dups inc_append_history hist_find_no_dups
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# Prompt setup
fpath+=($HOME/development/Dotfiles/submodules/pure)
autoload -U promptinit; promptinit
prompt pure

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Git functions
source ~/development/Dotfiles/zsh/fzf-git.zsh

# Fish-like autosuggestions
source ~/development/Dotfiles/submodules/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' forward-word
bindkey '^E' autosuggest-execute

# Add xdebug aliases (VM only)
if [[ $(uname) != "Darwin" ]]; then
  source ~/development/bin/xdebug_toggle
fi

# Syntax highlighting
source ~/development/Dotfiles/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add git credentials silently
{ eval `ssh-agent`; ssh-add ~/.ssh/id_ed25519_github; } &>/dev/null
