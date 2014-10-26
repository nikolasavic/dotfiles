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
echo 'done!'
