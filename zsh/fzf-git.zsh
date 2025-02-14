# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --ansi \
      --border \
      --cycle \
      --multi \
      --preview-window="down:50%" \
      --height 80% "$@" \
      --bind='alt-k:preview-up' \
      --bind='alt-j:preview-down'
}

# gbd - interactive git branch deletion
# based off https://www.peterp.me/articles/cli-tips-interactive-branch-delete/
# use tab to select multiple
# Drop this in your .bashrc or .zshrc (assumes fzf is installed)
gbd() {
  local branches branch
  branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="[%(committerdate:short)] %(color:bold green)%(refname:short)%(color:reset) - %(contents:subject)" --color=always | egrep -v main) &&
  branch=$(echo "$branches" | fzf --multi --ansi --preview 'git show {2}' ) &&
  git branch -D $(echo "$branch" | awk '{print $2}')
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac |
  sed 's/^..//' | cut -d' ' -f1 |
  sed "s#remotes/[^/]*/##"
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b
unset -f bind-git-helper
