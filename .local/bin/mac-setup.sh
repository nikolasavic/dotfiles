echo "*\$* Starting MacOS Setup"

# Install Homebrew
~/.local/bin/homebrew/verify_install.sh

# Install Homebrew file package
echo "*\$* Verifying Homebrew file installed"
result=$(~/.local/bin/homebrew/verify_package_installed.sh "rcmdnk/file/brew-file")
if [[ $? != 0 ]]; then
  echo "*\$* Installing Homebrew file"
  brew install rcmdnk/file/brew-file
fi
echo "*\$* Homebrew file installed"

# Brewfile install
echo "*\$* Installing Brewfile"
brew file install

# vim-plug
echo "*\$* Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "*\$* MacOS Setup complete!"
