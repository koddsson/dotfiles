// Installation script for a non-bare repository. This scripts assumes debian buster as the host.

// make cache folder (if missing) and take ownership
await $`sudo mkdir -p /usr/local/n`
await $`sudo chown -R $(whoami) /usr/local/n`
// make sure the required folders exist (safe to execute even if they already exist)
await $`sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share`
// take ownership of Node.js install destination folders
await $`sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share`

await $`sudo npm install -g npm@latest n`

await $`n latest`

// Re-hash the shell so it picks up changes from n
await $`hash -r`

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

const globalNpmPackages = [
  '@koddsson/coworking-with',       // @koddsson/coworking-with: utility to add `coworking-with` stanzas to commits
  'typescript-language-server',     // typescript-language-server: Needed for TypeScript LSP in neovim
  'vscode-langservers-extracted',   // vscode-langservers-extracted: Needed for various languages in neovim
  'stylelint-lsp'                   // stylelint-lsp: Needed for stylelint in neovim
]

// Install npm packages
await $`npm install -g ${globalNpmPackages}`

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
