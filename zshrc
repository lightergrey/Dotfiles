#!/bin/zsh

export PATH=$HOME/opt/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH
setopt correctall auto_cd

# Vim mode
bindkey -v

export EDITOR="vim"
export AUTOSSH_GATETIME=0

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# Prompt setup
autoload -U promptinit; promptinit
prompt pure

# Completion
autoload -U compinit; compinit

# Xdebug aliases
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

# Syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Etsy workflow functions
source ~/.zsh/etsy-workflow-functions.zsh

