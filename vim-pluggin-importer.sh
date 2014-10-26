echo 'importing pluggins...'

# Setup directories
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle


# Install Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

  # curl flag refresher:
  # -L, --location, follows redirects
  # -S, --show-error,  When used with -s it makes curl show an error message if it fails.
  # -s, --silent Silent, or quiet mode. Don't show progress meter or error messages.  Makes Curl mute.
  # -o, --output <file>, Write  output to <file> instead of stdout.

# Install Vim-Surround
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround

# Install Nerdtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# Install Rainbow Parens
git clone https://github.com/kien/rainbow_parentheses.vim.git ~/.vim/bundle/rainbow-parens
