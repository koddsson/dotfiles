# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# For my custom scripts and commands
PATH="$HOME/.bin:$PATH"

export WORKBREW_SEND_ANALYTICS=1
export EDITOR="zed"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git direnv autojump)

source $ZSH/oh-my-zsh.sh

# Add deno installed binaries to path
export PATH="$HOME/.deno/bin:$PATH"

# Workbrew requires a custom npm global path.
# See https://console.workbrew.com/documentation/troubleshooting#code-npm-install-g-code-fails-with-code-eacces-code-errors
export PATH="$HOME/.npm-global/bin:$PATH"

export HOMEBREW_DOWNLOAD_CONCURRENCY=auto
export PATH="$HOME/.local/bin:$PATH"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
