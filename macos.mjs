// Install all brew packages
await $`brew update`
await $`brew bundle install`

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
