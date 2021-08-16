[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X
system_type=$(uname -s)
distro=$(cat /etc/os-release | grep ^ID)
if [[ "$system_type" == "Linux" ]] && [[ "$distro" == "ID=arch" ]] && [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
