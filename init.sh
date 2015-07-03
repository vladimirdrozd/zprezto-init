#!/bin/bash
# 
# ZSH Prezto initiation script
#
#
# basic configuration

RED='\e[0;31m'
NC='\e[0m' # No Color

init_error() {
	echo "$(tput setaf 1)Script initialization error:\n--> $1\n--> ZPrezto may already be initialized. To reinitialize it run with '--reinitialize' option.(tput sgr 0)"
	exit 0;
}

checkFolder() {
	echo "---> Checking folder '$1'"
	if [ -d $1 ]; then
		echo "  -> Folder '$1' exists, exiting..."
		init_error "Folder '$1' already exists."
	fi
}

checkFile() {
	echo "---> Checking file '$1'"
	if [ -f $1 ]; then
		echo "  -> File '$1' exists, exiting..."
		init_error "File '$1' already exists."
	fi
}

reinitialize() {
	rm -Rf .zprezto
	rm -f .zlogin
	rm -f .zlogout
	rm -f .zpreztorc
	rm -f .zprofile
	rm -f .zshenv
	rm -f .zshrc
}

if [ "$1" = "--reinitialize" ]
	then
		echo "$(tput setaf 4)Running reinitialization. Deleting old config files..."$(tput setaf 4)
		reinitialize
		echo "$(tput setaf 4)Running new ZPrezto configuration. Deleting old config files..."
fi

if [ "$1" = "" ]
	then
		echo "$(tput setaf 4)No user name provided, setting shell user to 'forge'."$(tput setaf 4)
		SHELL_USER='forge'
	else
		echo "$(tput setaf 4)Running script for shell user '$1'."$(tput setaf 4)
		SHELL_USER=$1
fi

# Install ZSH
echo ""
echo "$(tput setaf 4)Installing ZSH:"$(tput setaf 4)
sudo apt-get install -y zsh

# Create empty ZSH RC file
echo ""
echo "$(tput setaf 4)Creating empty ZSH configuration:$(tput sgr 0)"
checkFile ".zshrc"
touch .zshrc

# Run ZSH initialization
echo ""
echo "$(tput setaf 4)Initializing ZPrezto:$(tput sgr 0)"
checkFolder ".zprezto"
zsh .zprezto-init/prezto-init.sh

# Change default shell to ZSH
echo ""
echo "$(tput setaf 4)Changing default shell to zsh for user '$SHELL_USER' :$(tput sgr 0)"
chsh -s /usr/bin/zsh "$SHELL_USER"
