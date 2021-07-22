# Installation script for a non-bare repository. This scripts assumes debian buster as the host.

mkdir $HOME

# No thank you
rm -rf .oh-my-bash
rm -rf .oh-my-zsh
rm .zshrc

# I'd like to use fish, please
apt-get install -y fish
chsh -s /usr/bin/fish

# Debian Buster has a old version of neovim so we need to install the AppImage
apt-get install -y libfuse2
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

# Update node to a decent version
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

# Update npm
npm install -g npm@latest

# Install npm packages

# n: node version manager that I like
# @koddsson/coworking-with: utility to add `coworking-with` stanzas to commits

npm install -g n @koddsson/coworking-with

# Start using latest node version
n latest

if [ -n "$CODESPACES" ]; then
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.config/ /root/
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitconfig /root/.gitconfig
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitignore /root/.gitignore
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitmodules /root/.gitmodules
fi

# Pull any submodules
git submodule update --init

# Update path after installing latest node
PATH="$PATH"
