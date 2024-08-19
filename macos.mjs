// make cache folder (if missing) and take ownership
await $`sudo mkdir -p /usr/local/n`
await $`sudo chown -R $(whoami) /usr/local/n`
// make sure the required folders exist (safe to execute even if they already exist)
await $`sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share`
// take ownership of Node.js install destination folders
await $`sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share`

await spinner(async () => {
  // Install my preferred node version manager `n` and start using the node LTS.
  await $`npm install -g npm@latest n`
  await $`n lts`

  
  // Re-hash the shell so it picks up changes from n
  await $`hash -r`
  // Update path after installing latest node
  await $`PATH="$PATH"`

  // Install all brew packages
  await $`brew update`
  await $`brew bundle install`
  
  
  // Install npm packages
  const globalNpmPackages = [
    '@koddsson/coworking-with',       // @koddsson/coworking-with: utility to add `coworking-with` stanzas to commits
    'typescript-language-server',     // typescript-language-server: Needed for TypeScript LSP in neovim
    'vscode-langservers-extracted',   // vscode-langservers-extracted: Needed for various languages in neovim
    'tree-sitter',                    // Needed so that treesitter can install parsers automatically
    'typescript',                     // Needed for.. something.
  ]
  await $`npm install -g ${globalNpmPackages}`
  
  // Pull any submodules
  await $`git submodule update --init`
  
  // Create the config directory if it doesn't exist already
  await $`mkdir -p "$HOME/.config/"`
  
  // Symlink config files
  await $`ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc"`
  await $`ln -sf "$(pwd)/.config/nvim/" "$HOME/.config/"`
  await $`ln -sf "$(pwd)/.gitconfig" "$HOME/.gitconfig"`
  await $`ln -sf "$(pwd)/.gitignore" "$HOME/.gitignore"`
  await $`ln -sf "$(pwd)/.gitmodules" "$HOME/.gitmodules"`
  await $`ln -sf "$(pwd)/.gitmessage" "$HOME/.gitmessage"`
  
  // Install vim plugins
  await $`nvim +'PlugInstall --sync' +qa`
});
