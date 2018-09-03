# Dotfiles

This is an attempt to get some more unity in the way I use my command-line in osx and linux. I have made one important step about a thousand years ago: the usage of [zsh](http://www.zsh.org/).

Zsh is a shell designed for interactive use, although it is also a powerful scripting language.

As many shell-related stuff, zsh came with a 'dotfile' to configure the general usage and look and feel. I would like to have as much consistency in the usage and look and feel in my shells. And it shoudn't be too different under linux or mac os. One major improvement in this case is using the excellent oh-my-zsh project. Oh My Zsh will not make you a 10x developer...but you might feel like one.

## Installation
Install oh-my-zsh

	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

Install the following plugins in your `.zshrc`:

	plugins=(git npm z)

Remove the custom directory

	cd .oh-my-zsh
	rm -rf custom

Checkout this project into custom

	git clone git@github.com:tuvokki/dotfiles.git custom

## Usage
From this point on forward you'll have the same shell functions and theme on the installed machine.

There are some os/usage related specifics that can be installed. For instance you can copy the OSX related aliasses to your shell by copying (or symlinking) the related file in the custom directory:

	cd .oh-my-zsh/custom
	cp extra/specific_osx.zsh .

For workstation specific usage you can add additional files starting with `workstation` which will be ignored by git so there will be nog stashing and merging when this repo is updated. 

Example: `workstation_office.zsh` will hold your office related aliasses like `alias cts=ssh team@teamserver.office.com`

Silly test commit.
