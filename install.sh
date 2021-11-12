# Update node to a decent version
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
sudo apt-get install -y nodejs

# Update npm
npm install -g npm@latest zx

zx install.mjs
