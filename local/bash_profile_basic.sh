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
