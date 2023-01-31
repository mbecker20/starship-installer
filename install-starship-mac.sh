#!/bin/zsh

brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font

mkdir -p $HOME/.starship/bin

curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir $HOME/.starship/bin

if ! grep "STARSHIP_CONFIG" $HOME/.zshrc > /dev/null; then
	echo "" >> $HOME/.zshrc
	echo 'export STARSHIP_CONFIG=$HOME/.starship/starship.toml' >> $HOME/.zshrc
fi

if ! grep ".starship/bin" $HOME/.zshrc > /dev/null; then
	echo "" >> $HOME/.zshrc
	echo 'path+=("$HOME/.starship/bin")' >> $HOME/.zshrc
fi

if ! grep "starship init zsh" $HOME/.zshrc > /dev/null; then
	echo "" >> $HOME/.zshrc
	echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc
fi

if ! test -f "$HOME/.starship/starship.toml"; then
	cp $HOME/starship-installer/starship.toml $HOME/.starship/starship.toml
fi