# Install my editor and IDE
apt-get install neovim

# Update node to a decent version
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

# Update npm
npm install -g npm@latest

# Install npm packages
npm install -g \
  n                        \ # node version manager
  @koddsson/coworking-with   # utility tool to handle co-singing of commits
  
# Start using latest node version
n latest
  
# Update path after installing latest node
PATH="$PATH"
