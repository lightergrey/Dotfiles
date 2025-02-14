# If not running interactively, return early
# This was meant to fix an issue where Gateway failed to start remote IDE for PhpStorm remote editing
# It fixed that, but caused zsh not to start
# [[ $- == *i* ]] || return

# Check if the current shell is not zsh and if the shell is interactive
if [ "$SHELL" != "/usr/bin/zsh" ] && [ -t 0 ]; then
  export SHELL="usr/bin/zsh"
  exec /usr/bin/zsh
fi
