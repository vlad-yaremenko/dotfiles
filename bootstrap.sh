#!/usr/bin/env bash
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${RED}Update system...${NC}"
echo ""
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages
sudo apt-get dist-upgrade  # Installs updates (new ones)

echo ""
echo -e "${RED}Install system dependencies...${NC}"
echo ""
sudo apt-get install --yes \
  git \
  curl

echo ""
echo -e "${RED}Install slack...${NC}"
echo ""
sudo snap install slack --classic

echo ""
echo -e "${RED}Install skype...${NC}"
echo ""
sudo apt-get install -y apt-transport-https
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list
sudo apt-get update
sudo apt-get install --yes skypeforlinux

echo ""
echo -e "${RED}Install chrome...${NC}"
echo ""
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install --yes google-chrome-stable

echo ""
echo -e "${RED}Install node.js...${NC}"
echo ""
curl -sL https://deb.nodesource.com/setup_9.x | sudo bash -
sudo apt install nodejs

echo ""
echo -e "${RED}Create projects directory${NC}"
echo ""
mkdir ~/Projects

echo ""
echo -e "${RED}Clone dotfiles project${NC}"
echo ""
cd ~/Projects
git clone https://github.com/vlad-yaremenko/dotfiles.git

echo ""
echo -e "${RED}Load vim submodules${NC}"
echo ""
cd ~/Projects/dotfiles
git submodule update --init


echo ""
echo -e "${RED}Create symbol links${NC}"
echo ""

echo -e "${RED}For .editorconfig${NC}"
ln -s ~/Projects/dotfiles/.editorconfig ~/.editorconfig
echo -e "${RED}For .gitconfig${NC}"
ln -s ~/Projects/dotfiles/.gitconfig ~/.gitconfig


echo ""
echo -e "${RED}Install vim...${NC}"
echo ""
sudo apt-get install --yes vim

echo -e "${RED}For .vim folder${NC}"
ln -s ~/Projects/dotfiles/.vim ~/.vim
echo -e "${RED}For .vimrc${NC}"
ln -s ~/Projects/dotfiles/.vimrc ~/.vimrc


echo ""
echo -e "${RED}Install gvim...${NC}"
echo ""
sudo apt-get install --yes vim-gnome

echo -e "${RED}For .gvimrc${NC}"
ln -s ~/Projects/dotfiles/.gvimrc ~/.gvimrc


echo ""
echo -e "${RED}Install neovim...${NC}"
echo ""
sudo apt-get install --yes neovim


echo ""
echo -e "${RED}Run autoremove...${NC}"
echo ""
sudo apt autoremove --yes


echo ""
echo -e "${RED}Done...${NC}"
echo ""
