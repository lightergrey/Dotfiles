# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

alias tb="cd ~/Sites/Tinybop-Website"
alias sb="cd ~/Sites/tinybop-scoreboard"
alias js="cd ~/Sites/joshstewart"
alias wt="cd ~/Sites/wear-this"
alias tbssh="ssh root@70.32.89.52"
alias gpr="git pull --rebase=preserve"

# Git sync
# gsy() {
#     git pull --rebase=preserve &&
#     git push
# }

bday=1399561860
now=$(date +%s)
diff=$(($now - $bday))

local tmp=$diff
local years=$(( tmp / 60 / 60 / 24 / 365 ))
local months=$(( tmp / 60 / 60 / 24 / 7 / 4.33 % 12 ))
local weeks=$(( tmp / 60 / 60 / 24 / 7 % 4.33 ))
local days=$(( tmp / 60 / 60 / 24 % 7 ))
local hours=$(( tmp / 60 / 60 % 24 ))
local minutes=$(( tmp / 60 % 60 ))
local seconds=$(( tmp % 60 ))

echo -n "$fg[green]Ezra is "
(( $years > 0 )) && echo -n "${years}y "
(( $months > 0 )) && echo -n "${months}mo "
(( $weeks > 0 )) && echo -n "${weeks}w "
(( $days > 0 )) && echo -n "${days}d "
(( $hours > 0 )) && echo -n "${hours}h "
(( $minutes > 0 )) && echo -n "${minutes}m "
echo "${seconds}s old."
