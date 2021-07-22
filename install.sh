# Installation script for a non-bare repository. This scripts assumes debian buster as the host.

# Debian Buster has a old version of neovim so I have to build my own.
apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

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
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.config /root/.config
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitconfig /root/.gitconfig
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitignore /root/.gitignore
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles/.gitmodules /root/.gitmodules
fi

# Pull any submodules
git submodule update --init

# Update path after installing latest node
PATH="$PATH"
