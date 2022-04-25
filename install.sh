# Update node to a decent version
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt-get install -y nodejs

# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# Update npm, n and zx
npm install -g n@latest

n latest

npm install -g npm@latest zx@latest

zx install.mjs
