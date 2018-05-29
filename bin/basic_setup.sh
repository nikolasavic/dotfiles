#!/bin/bash


echo ""
echo "Starting setup..."

# Install Homebrew
command -v brew >/dev/null 2>&1 && echo "Homebrew installed!" || {
 echo "Installing Homebrew..."
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# Install Git
if brew ls --versions git > /dev/null; then
  echo "Git installed!"
else
  echo "Installing Git..."
  brew install git
fi

# Install bash-completion
if brew ls --versions bash-completion > /dev/null; then
  echo "bash-completion installed!"
else
  echo "Installing bash-completion..."
  brew install bash-completion
fi

# Install bash-git-prompt
if brew ls --versions bash-git-prompt > /dev/null; then
  echo "bash-git-prompt installed!"
else
  echo "Installing bash-git-prompt..."
  brew install bash-git-prompt
fi


echo ""
echo "Setup complete!"
