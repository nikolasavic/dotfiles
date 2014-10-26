echo 'importing pluggins...'

# Setup directories
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle


# Install Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo 'done!'
