# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lightergrey2"
# ZSH_THEME="pure"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower brew bundle cap common-aliases dirhistory gem git git-sync github node npm osx rails ruby rvm ssh-agent sublime terminalapp vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin:/Users/josh/.rvm/bin:/Users/josh/.rvm/gems/ruby-2.1.2/bin:/Users/josh/.rvm/rubies/ruby-2.1.2/bin:/Users/josh/.rvm/gems/ruby-2.1.2@global/bin:/opt/X11/bin:/usr/local/git/bin:$PATH

# Common paths
alias tb="cd ~/Sites/Tinybop-Website"
alias sb="cd ~/Sites/tinybop-scoreboard"
alias js="cd ~/Sites/joshstewart"
alias wt="cd ~/Sites/wear-this"
alias tbssh="ssh root@70.32.89.52"

# Common tasks
alias gpr="git pull --rebase=preserve"
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Mushy stuff
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
