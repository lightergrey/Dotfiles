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
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Completion
autoload -U compinit; compinit

# Aiases
alias xdebugoff='sudo sed -i '\''s/.*zend_extension.*/; zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"/'\'' /etc/php7/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugon='sudo sed -i '\''s/.*zend_extension.*/zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"/'\'' /etc/php7/php.d/xdebug.ini; sudo systemctl restart httpd'
alias xdebugstatus='grep '\''; zend_extension="\/usr\/lib64\/php\/modules7\/xdebug\.so"'\'' /etc/php7/php.d/xdebug.ini >/dev/null && echo "xdebug is off" || echo "xdebug is on"'

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Git functions
# source ~/.zsh/fzf-git.zsh

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^F' forward-word
bindkey '^E' autosuggest-execute

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/opt/nvm/nvm.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


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
