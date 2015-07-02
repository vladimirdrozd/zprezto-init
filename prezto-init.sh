# Clone repository
git clone --recursive https://github.com/vladimirdrozd/zprezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove old zsh config and copy new
rm -f .zshrc
cp .zprezto.zshrc .zshrc

# Create Prezto configuration files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done