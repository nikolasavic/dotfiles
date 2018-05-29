#!/bin/bash


echo ""
echo "Starting Python setup..."

# Install Python
if brew ls --versions python > /dev/null; then
  echo "Python installed!"
else
  echo "Installing Python..."
  brew install python
fi

# Install Virtualenv
if pip3 list | grep -F virtualenv > /dev/null; then
  echo "Virtualenv installed!"
else
  echo "Installing virtualenv..."
  pip3 install virtualenv
fi

# Install Yapf
if pip3 list | grep -F yapf > /dev/null; then
  echo "Yapf installed!"
else
  echo "Installing yapf..."
  pip3 install yapf
fi
