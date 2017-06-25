#!/bin/zsh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export GITHUB_USER="jstewart"
export EDITOR="nvim"

# Prompt setup
autoload -Uz compinit promptinit
compinit
promptinit

prompt pure
setopt correctall

setopt auto_cd

alias vim="nvim"
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias ..="cd .."
alias ...="cd ../.."

alias gistd="gist -t diff"

alias ga="git add"
alias gaa="git add --all"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gpristine="git reset --hard && git clean -df"
alias gcmsg="git commit -m"
alias gcma="git commit --amend"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git pull --rebase --stat"
alias glr="git pull --rebase --stat origin master"
alias gm="git merge --squash"
alias gp="git pull --rebase --stat && git push"
alias gst="git status -sb"
alias gsta="git stash save"
alias gstaa="git stash apply"
alias gpoop="git stash && git pull --rebase --stat && git stash pop"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gwch="git whatchanged -p --abbrev-commit --pretty=medium"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
