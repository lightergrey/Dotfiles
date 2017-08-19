#!/bin/zsh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
setopt correctall auto_cd

# Vim mode
bindkey -v

export EDITOR="nvim"

# Prompt setup
autoload -U promptinit; promptinit
prompt pure

# Completion
autoload -U compinit; compinit

# Aiases
alias ...="cd ../.."
alias ..="cd .."
alias ga="git add"
alias gaa="git add --all"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gcma="git commit --amend"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gistd="gist -t diff"
alias gl="git pull --rebase --stat"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glr="git pull --rebase --stat origin master"
alias gm="git merge --squash"
alias gp="git pull --rebase --stat && git push"
alias gr="git reset"
alias gst="git status -sb"
alias ll="ls -al"
alias ln="ln -v"
alias vim="nvim"
alias zshrc="$EDITOR ~/.zshrc"

# FZF Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
