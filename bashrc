# If not running interactively, return early
[[ $- == *i* ]] || return

# Use zsh
if [ "$SHELL" != "/usr/bin/zsh" ]
then
    export SHELL="/usr/bin/zsh"
    exec /usr/bin/zsh
fi

# starting ssh agent
eval `ssh-agent -s`
# adding identity
ssh-add ~/.ssh/id_ed25519_github


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
