# Linux setup notes

``` sh
apt install git
apt install unzip
apt install make
apt install clang
apt install gcc
apt install build-essential
apt install ripgrep
apt install fzf
apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
apt install zoxide
apt install gh
gh auth login

cd ~
mkdir .config
cd .config
git clone https://github.com/a-eski/neovim-config ./nvim
```
