#!/bin/bash

mkdir -p $HOME/.starship/bin

curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir $HOME/.starship/bin

if ! grep ".starship/bin" $HOME/.bashrc > /dev/null; then
	echo "" >> $HOME/.bashrc
	echo 'export PATH=$HOME/.starship/bin:$PATH' >> $HOME/.bashrc
fi

if ! grep "STARSHIP_CONFIG" $HOME/.bashrc > /dev/null; then
	echo "" >> $HOME/.bashrc
	echo 'export STARSHIP_CONFIG=$HOME/.starship/starship.toml' >> $HOME/.bashrc
fi

if ! grep "starship init bash" $HOME/.bashrc > /dev/null; then
	echo "" >> $HOME/.bashrc
	echo 'eval "$(starship init bash)"' >> $HOME/.bashrc
fi

if ! test -f "$HOME/.starship/starship.toml"; then
	cp $HOME/starship-installer/starship.toml $HOME/.starship/starship.toml
fi

