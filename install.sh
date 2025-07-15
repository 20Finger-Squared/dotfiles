#!/bin/sh

if [ -d "/nix" ] ; then
	echo "Nix is installed"
else
	curl -fsSL https://install.determinate.systems/nix | sh -s -- install
fi

if ! command -v brew &>/dev/null; then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

brew install git

git pull https://github.com/eclipxia/dotfiles

if [ -d ~/.config/nvim ] ; then 
	mv ~/.config/nvim ~/.config/nvim_old; cp -r ~/dotfiles/nvim ~/.config/nvim
else 
	cp -r ~/dotfiles/nvim ~/.config/
fi

rm ~/.gitconfig; cp ~/dotfiles/.gitconfig ~/; brew install luarocks
