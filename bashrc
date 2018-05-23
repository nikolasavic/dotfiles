# This file should be used for configuring bash (appearance, aliases, functions)
# Environmental variables or other configuration should be in .bash_profile

# Uncomment the next the following for debugging with .bash_profile
# This file is loaded after .bash_profile
# echo 'this is from .bashrc'

# Sourcing
# source ~/dotfiles/local/dot_test.sh
source ~/dotfiles/local/dot_git.sh
source ~/dotfiles/local/dot_ruby.sh
source ~/dotfiles/local/dot_bash_functions.sh

# Environmental Variables
export EDITOR='vim'

# File System
alias l='ls -G'
alias ls='ls -G'
alias la='ls -aGF'
alias lsa='ls -laGF'
alias ..='cd ..; ls'
alias ...='cd ../..'

# Frequent destinations
alias P="cd ~/Projects; ls"
alias cddesk="cd ~/Desktop; ls"
alias cddot="cd ~/dotfiles; ls"
alias cdvim="cd ~/.vim; ls"

# Prevent headaches
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'

# Shell
alias k='clear'
alias q='exit'

# Misc
# Unix
alias findn='find . -name'
export GREP_OPTIONS='--color=always'

# Homebrew
alias bud='brew update && brew doctor'
