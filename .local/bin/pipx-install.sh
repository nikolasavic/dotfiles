echo "*\$* Starting MacOS Setup"
if ! which pipx > /dev/null; then
   echo "*\$* pipx not found, aborting!"
   exit 1
fi

echo "*\$* Installing black"
pipx install black

echo "*\$* Installing flake8"
pipx install flake8
