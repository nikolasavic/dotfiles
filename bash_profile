# This file, .bash_profile, is executed for login shells.
# Mac OS X starts a login shell by default and executes .bash_profile each time.

# Uncomment the next the following for debugging with .bash_profile
# This file is loaded before .bashrc
# echo 'this is from .bash_profile'

# /usr/local and its subdirectories are used for the installation of software and
# other files for use on the local machine. What this really means is that software
# that is not part of the official distribution (which usually goes in /usr/bin) goes here.

# Add User bin
export PATH=/Users/nsavic/bin:$PATH

# Git Completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git Prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# source ~/.bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Sourcing
# source ~/dotfiles/local/dot_test.sh
