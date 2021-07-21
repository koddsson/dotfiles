# Install my editor and IDE
apt-get install -y neovim

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
  
# Update path after installing latest node
PATH="$PATH"
