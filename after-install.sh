#!/bin/bash

cd ~
sudo apt update && sudo apt upgrade
sudo apt install curl vim git xclip python3-pip python-is-python3 wslu -y

# for scrapy show view(response) on host windows browser
echo 'export BROWSER=wslview' >> ~/.bashrc


# git config
git config --global user.name "mix060514"
git config --global user.email "mix060514@gmail.com"


# nvim
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo rm nvim-linux-x86_64.tar.gz

if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi

cd ~/.config
git clone https://www.github.com/mix060514/nvim
cd ~

# install jetbrains mono
mkdir -p ~/jetbrainsmono-temp
curl -L https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip -o ~/jetbrainsmono-temp/JetBrainsMono-2.304.zip
mkdir ~/jetbrainsmono-temp/JetBrainsMono && unzip ~/jetbrainsmono-temp/JetBrainsMono-2.304.zip -d ~/jetbrainsmono-temp/JetBrainsMono
sudo mkdir -p /usr/share/fonts/truetype/jetbrainsmono
sudo mv ~/jetbrainsmono-temp/JetBrainsMono/*.ttf /usr/share/fonts/truetype/jetbrainsmono/
sudo fc-cache -fv
rm -rf ~/jetbrainsmono-temp

# anaconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all

echo "Setup completed successfully!"
echo "Please close an reopen termial"

