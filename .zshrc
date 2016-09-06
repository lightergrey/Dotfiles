# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="bullet-train"
BULLETTRAIN_TIME_SHOW="false"
BULLETTRAIN_DIR_BG="10"
BULLETTRAIN_DIR_FG="8"
BULLETTRAIN_GIT_BG="4"
BULLETTRAIN_GIT_FG="0"
BULLETTRAIN_GIT_DIRTY=" "
BULLETTRAIN_GIT_CLEAN=""
BULLETTRAIN_GIT_COLORIZE_DIRTY="true"
BULLETTRAIN_GIT_EXTENDED="true"
BULLETTRAIN_GIT_ADDED="+"
BULLETTRAIN_GIT_MODIFIED="±"
BULLETTRAIN_GIT_DELETED="−"
BULLETTRAIN_GIT_UNTRACKED="✭"
BULLETTRAIN_RUBY_SHOW="false"
BULLETTRAIN_PROMPT_CHAR="❯"

# DEFAULT_USER="Josh"
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
plugins=(atom brew bundler common-aliases emoji git github npm osx z zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH
# export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin:/opt/X11/bin:/usr/local/git/bin:$PATH

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
#bday=1399561860
bday=1399565460
now=$(date +%s)
total_seconds=$(($now - $bday))

local seconds=$(( total_seconds % 60 ))
local total_minutes=$(( total_seconds / 60 ))
local minutes=$(( total_minutes % 60 ))
local total_hours=$(( total_minutes / 60 ))
local hours=$(( total_hours % 24 ))
local total_days=$(( total_hours / 24 ))
local days=$(( total_days % 7 ))
local total_weeks=$(( total_days / 7 ))
local weeks=$(( total_weeks % 52 ))
local years=$(( total_weeks / 52 ))

echo -n "$fg[green]Ezra is "
(( $years > 0 )) && echo -n "${years}y "
(( $weeks > 0 )) && echo -n "${weeks}w "
(( $days > 0 )) && echo -n "${days}d "
(( $hours > 0 )) && echo -n "${hours}h "
(( $minutes > 0 )) && echo -n "${minutes}m "
echo "${seconds}s old."

export EDITOR=/Applications/Atom.app/Contents/MacOS/Atom
