# Env
source $HOME/.config/env/defaults
source $HOME/.config/env/fzf

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X
system_type=$(uname -s)
if [[ "$system_type" == "Linux" ]]; then
  distro=$(cat /etc/os-release | grep ^ID)
  if [[ "$distro" == "ID=arch" ]] && [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
  fi
fi
