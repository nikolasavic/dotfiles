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

# Install Paredit
git clone https://github.com/vim-scripts/paredit.vim.git ~/.vim/bundle/paredit

# Install Tlib
git clone https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib

# Install TSlime
git clone https://github.com/vim-scripts/tslime.vim.git ~/.vim/bundle/tslime

# Install Vim-Rails
git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails

# Install Vim-Fugitive
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# Install Vim-Endwise
git clone https://github.com/tpope/vim-endwise.git ~/.vim/bundle/vim-endwise

# Install Vim-Fireplace
git clone https://github.com/tpope/vim-fireplace.git ~/.vim/bundle/vim-fireplace

# Install Vim-Dispatch
git clone https://github.com/tpope/vim-dispatch.git ~/.vim/bundle/vim-dispatch

# Install Vim-Projectionist
git clone https://github.com/tpope/vim-projectionist.git ~/.vim/bundle/vim-projectionist

# Install Vim-Bundle
git clone https://github.com/tpope/vim-bundler.git ~/.vim/bundle/vim-bundle

# Install Vim-Heroku
git clone https://github.com/tpope/vim-heroku.git ~/.vim/bundle/vim-heroku

# Install Vim-Commentary
git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

