#!/bin/zsh

export PATH=$HOME/opt/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
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

# Aiases
alias vm="autossh -M 0 -o 'ServerAliveInterval 30' -o 'ServerAliveCountMax 3' -t jstewart.vm.ny5.etsy.com 'cd ~/development/Etsyweb/ && exec \$SHELL'"
alias xdebugoff='sudo sed -i '\''s/.*zend_extension.*/; zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"/'\'' /etc/php7/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugon='sudo sed -i '\''s/.*zend_extension.*/zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"/'\'' /etc/php7/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugstatus='grep '\''; zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"'\'' /etc/php7/php.d/xdebug.ini >/dev/null && echo "xdebug is off" || echo "xdebug is on"'

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Git functions
source ~/.zsh/fzf-git.zsh

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' forward-word
bindkey '^E' autosuggest-execute

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

magic-enter () {
  # If commands are not already set, use the defaults
  [ -z "$MAGIC_ENTER_GIT_COMMAND" ] && MAGIC_ENTER_GIT_COMMAND="clear && git status -sb ."
  [ -z "$MAGIC_ENTER_OTHER_COMMAND" ] && MAGIC_ENTER_OTHER_COMMAND="clear && ls -lh ."

  if [[ -z $BUFFER ]]; then
    echo ""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      eval "$MAGIC_ENTER_GIT_COMMAND"
      zle accept-line
    else
      eval "$MAGIC_ENTER_OTHER_COMMAND"
      zle accept-line
    fi
    # zle redisplay
  else
    zle accept-line
  fi
}
zle -N magic-enter
bindkey "^M" magic-enter

