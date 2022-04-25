# Update node to a decent version
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt-get install -y nodejs

npx --yes zx install.mjs
