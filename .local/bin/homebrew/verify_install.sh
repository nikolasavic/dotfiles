#!/bin/bash
echo "*\$* Verifying Homebrew installed"
if [[ $(command -v brew) == "" ]]; then
    echo "*\$* Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
fi
echo "*\$* Homebrew installed"
