#!/bin/bash

# Install ZSH
sudo apt-get install -y zsh

# Create empty ZSH RC file
touch .zshrc 

# Run ZSH initialization
zsh .zprezto-init/prezto-init.sh