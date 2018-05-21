# Git Prompt
GIT_PROMPT_ONLY_IN_REPO=1 # Use the default prompt when not in a git repo.
GIT_PROMPT_THEME=Solarized

# Git
alias g='git'
alias gs='git status'
alias gst='git status'
alias gsho='git show'
alias gcl='git clone'
alias gfo='git fetch origin'

alias gd='git diff'
alias gdc='git diff --cached'

alias gm='git merge'

alias gsh='git stash'
alias gshp='git stash pop'

# Add
alias ga='git add'
alias gall='git add -A .'

# Commit
alias gc='git commit'
alias gcm='git commit -m'
alias gcf='git commit --fixup'
alias gcam='git commit --amend'
alias gcv='git commit -v'
alias gcp='gcv -p'

# Rebase
alias gre='git rebase'
alias grei='git rebase -i'
alias greia='git rebase -i --autosquash'
alias grea='git rebase --abort'
alias grec='git rebase --continue'
alias gres='git rebase --skip'
alias gcoo="git checkout --ours"
alias gcot="git checkout --theirs"

# Reset
alias gr='git reset'
alias grp='git reset -p'
alias grh='git reset --hard'
alias gclear='gall; git reset --hard HEAD'

# Push/Pull
alias gp='git push'
alias gpo='git push origin'
alias gpfo='git push --force origin'
alias gl='git pull'

# Branches
alias gb='git branch'
alias gbr='git branch -r'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gdel='git branch -D'
alias grdel='git push origin --delete'

alias glog='git log --graph --all --oneline --color --decorate=short'
