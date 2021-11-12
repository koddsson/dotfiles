// Installation script for a non-bare repository. This scripts assumes debian buster as the host.

// Remove bash and zshrc configs
try {
  await $`rm -rf .oh-my-bash`
  await $`rm -rf .oh-my-zsh`
  await $`rm .zshrc`
} catch (error) {
  console.log(error)
}

// Install fish
await $`sudo apt-get install -y fish`
await $`sudo chsh -s /usr/bin/fish`

// Debian Buster has a old version of neovim so we need to install the AppImage
await $`sudo apt-get install -y libfuse2`

await $`sudo apt install fuse -y`
await $`sudo groupadd fuse`
await $`sudo usermod -a -G fuse $(whoami)`

// TODO: Build neovim from source instead
await $`wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage`
await $`chmod u+x nvim.appimage`
await $`sudo mv nvim.appimage /usr/local/bin/nvim`

// Update node to a decent version
await $`curl -fsSL https://deb.nodesource.com/setup_16.x | bash -`
await $`sudo apt-get install -y nodejs`

// Update npm
await $`npm install -g npm@latest`
  
const globalNpmPackages = [
  'n',                              // n: node version manager that I like
  '@koddsson/coworking-with',       // @koddsson/coworking-with: utility to add `coworking-with` stanzas to commits
  'typescript-language-server',     // typescript-language-server: Needed for TypeScript LSP in neovim
  'vscode-langservers-extracted',   // vscode-langservers-extracted: Needed for various languages in neovim
  'stylelint-lsp'                   // stylelint-lsp: Needed for stylelint in neovim
]

// Install npm packages
await $`npm install -g ${globalNpmPackages}`

// Start using latest node version
await $`n latest`

// Pull any submodules
await $`git submodule update --init`

// Create the config directory if it doesn't exist already
await $`mkdir -p "$HOME/.config/"`

// Symlink config files
await $`ln -sf "$(pwd)/.config/nvim/" "$HOME/.config/"`
await $`ln -sf "$(pwd)/.gitconfig" "$HOME/.gitconfig"`
await $`ln -sf "$(pwd)/.gitignore" "$HOME/.gitignore"`
await $`ln -sf "$(pwd)/.gitmodules" "$HOME/.gitmodules"`
await $`ln -sf "$(pwd)/.gitmessage" "$HOME/.gitmessage"`

// Install vim plugins
await $`/usr/local/bin/nvim +'PlugInstall --sync' +qa`

// Update path after installing latest node
await $`PATH="$PATH"`
