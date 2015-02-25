# This file, .bash_profile, is executed for login shells.
# Mac OS X starts a login shell by default and executes .bash_profile each time.

# Uncomment the next the following for debugging with .bash_profile
# This file is loaded before .bashrc
# echo 'this is from .bash_profile'

# /usr/local and its subdirectories are used for the installation of software and
# other files for use on the local machine. What this really means is that software
# that is not part of the official distribution (which usually goes in /usr/bin) goes here.

# Add User bin
export PATH=/Users/Nikola/bin:$PATH

# Add Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# RBenv
eval "$(rbenv init -)"

# Sublime Text as default editor
# export EDITOR='subl -w'

# source ~/.bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc
