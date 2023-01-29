#!/bin/bash
echo "[-] install FiraCode [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
rm FiraCode.zip
fc-cache -fv
echo "finished install FiraCode"