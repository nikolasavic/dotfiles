# This file should be used for configuring bash (appearance, aliases, functions)
# Environmental variables or other configuration should be in .bash_profile

# Uncomment the next the following for debugging with .bash_profile
# This file is loaded after .bash_profile
# echo 'this is from .bashrc'

##
# Sourcing
###

# Git
# Displays prompt
source ~/.git-prompt.sh
# Completion
source ~/.git-completion.sh

##
# Environmental Variables
###

# IRC
# export IRCHOST="yourValue"
# export USER="yourValue"

# grep options
export GREP_OPTIONS='--color=always'

# Globals for .git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

# Sets colors for ls, see below for color reference chart
export LSCOLORS="exfxcxdxbxegedabagacad"
#export LSCOLORS="exgxbxDxCxEgEdxbxgxcxd"
export CLICOLOR=1

##
# Command line prompt
###

PROMPT_COMMAND='__git_ps1 "$UWhite$BIWhite\u:\h \w$Color_Off" " \$ "'
# Looks like:
# Nikola:Caspar ~/dotfiles (master) $

# Reference
# unstaged    *
# staged      +
# untracked   %
# stashed     $

##
# Functions
###

# Make directory and cd into it
mkcd () {
    mkdir -p "${1}"
    cd "${1}"
}

# List contents of directory upon moving into it
function c {
  cd $1
  ls
}

# one command to extract them all...
function extract () {
  if [ $# -ne 1 ]
  then
    echo "Error: No file specified."
    return 1
  fi
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

##
# Aliases
###

# Unix
alias j='jobs'
alias findn='find . -name'

# File System
alias sl='ls'
alias l='ls'
alias la='ls -aF'
alias lsa='ls -laF'
alias cd..='cd ..; la'
alias ..='cd ..; ls'
alias ...='cd ../..'
alias cd...='cd ../..; la'
alias cd....='cd ../../..; la'
alias cd.....='cd ../../../..; la'

# Frequent destinations
alias P="cd ~/Projects; ls"
alias D="cd ~/Downloads; ls"
alias desk="cd ~/Desktop; ls"
alias dbc="cd ~/Projects/DBC; ls"
alias dev="cd ~/Projects/DBC/dev; ls"
alias dot="cd ~/dotfiles; ls"
alias cdvim="cd ~/.vim; ls"

# Prevent headaches
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'

# Git
alias g='git'
alias gs='git status'
alias gst='git status'
alias gcl='git clone'
alias gfo='git fetch origin'

alias gd='git diff'
alias gdc='git diff --cached'

alias gm='git merge'
alias gms='git merge --squash'

alias gsh='git stash'
alias gshp='git stash pop'

# Add
alias ga='git add'
alias gau='git add -u .'
alias gall='git add -A .'
alias gac='gall; gcv'
alias gap='ga -p'

# Commit
alias gcm='git commit -m'
alias gc='git commit'
alias gcf='git commit --fixup'
alias gcaam='git add .;git commit --amend'
alias gcam='git commit --amend'
alias gcv='git commit -v'
alias gca='git commit -va'
alias gcp='gcv -p'

# Rebase
alias gre='git rebase'
alias grei='git rebase -i'
alias greia='git rebase -i --autosquash'
alias grea='git rebase --abort'
alias grec='git rebase --continue'
alias gres='git rebase --skip'

# Reset
alias gr='git reset'
alias grp='git reset -p'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gclear='gall; git reset --hard HEAD'

# Push/Pull
alias gp='git push'
alias gpo='git push origin'
alias gpfo='git push --force origin'

alias gph='git push heroku'
# alias gpom='git push origin master'
# alias gpoi='git push origin integration'
# alias gpod='git push origin development'
alias gpp='git pull && git push'
alias gl='git pull'
alias glo='git pull origin'

# Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"
alias gdel='git branch -D'
alias grdel='git push origin --delete'

alias glog='git log --graph --all --oneline --color --decorate=short'

function ggrep () {
  git log --oneline --all -i --grep=$1
}

# Rails
alias rc='rails console'

# ActiveRecord
alias bxall='bx rake db:drop && bx rake db:create && bx rake db:migrate && bx rake db:seed'

# Tests
alias r='bundle exec rspec'
alias rs='bundle exec rspec spec'

# Shell
alias k='clear'
alias q='exit'
alias sourcedot='source ~/.bashrc'

# Tmux
alias tls='tmux ls'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tkill='tmux kill-session -t'

# RBenv
alias rv='rbenv versions'
alias rl='rbenv local'
alias rr='rbenv rehash'
alias rwhich='rbenv which'
alias rwhence='rbenv whence'

# Homebrew
alias bud='brew update && brew doctor'

# Ubuntu/Debian apt-get
alias sagu='sudo apt-get update'
alias sagi='sudo apt-get install'

# Grunt
alias grt='grunt'

# RVM
# alias v='ruby -v;rails -v'
# alias rl='rvm list'
# alias ru='rvm use'
# alias rgl='rvm gemset list'
# alias rgc='rvm gemset create'
# alias rgd='rvm gemset delete'
# alias rgu='rvm gemset use'

# Bundler Commands
alias b='bundle'
alias bx='bundle exec'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'

#  PostgreSQL
alias pg.start='pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
alias pg.stop='pg_ctl stop -s -m fast -D /usr/local/var/postgres'
alias pg.status='pg_ctl status -D /usr/local/var/postgres'

##
# Reference
###

# The values in LSCOLORS are codes corresponding to different colors for
# different types of files. The letter you use indicates which color to use,
# and the position in the string indicates what type of file should be that color.
# Each color comes in pairs – a foreground color and a background color. Here is
# a list of color values:

# a = black
# b = red
# c = green
# d = brown
# e = blue
# f = magenta
# g = cyan
# h = grey
# A = dark grey
# B = bold red
# C = bold green
# D = yellow
# E = bold blue
# F = magenta
# G = cyan
# H = white
# x = default

#1 directory
#2 symbolic link
#3 socket
#4 pipe
#5 executable
#6 block device
#7 character device
#8 executable with setuid set
#9 executable with setguid set
#10 directory writable by others, with sticky bit
#11 directory writable by others, without sticky bit

# Setup Color Constants for PS1
# Reset Colors
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White
