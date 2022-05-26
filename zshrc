#!/bin/zsh

export PATH=$HOME/opt/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
setopt auto_cd
unsetopt correct_all

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

# Aiases
alias vm="~/smux jstewart.vm.ny5.etsy.com"
alias xdebugoff='sudo sed -i '\''s/.*zend_extension.*/; zend_extension="\/usr\/lib64\/php\/modules8\/xdebug\.so"/'\'' /etc/php8/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugon='sudo sed -i '\''s/.*zend_extension.*/zend_extension="\/usr\/lib64\/php\/modules8\/xdebug\.so"/'\'' /etc/php8/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugstatus='grep '\''; zend_extension="\/usr\/lib64\/php\/modules8\/xdebug\.so"'\'' /etc/php8/php.d/xdebug.ini >/dev/null && echo "xdebug is off" || echo "xdebug is on"'
alias yarn='yarnpkg'
alias bat="/usr/local/bat/bat"
alias delta="/usr/local/delta/delta"

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Git functions
source ~/.zsh/fzf-git.zsh

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' forward-word
bindkey '^E' autosuggest-execute

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Magic Enter
magic-enter () {
  if [[ -z $BUFFER ]]; then
    echo ""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      # untracked files take longer to return so won't show
      git status -sbu
      # allows file list to show
      precmd
    else
      ls -lh
    fi
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N magic-enter
bindkey "^M" magic-enter

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(magic-enter)
