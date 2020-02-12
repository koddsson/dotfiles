# My bare dotfiles repository

This is how I manage my dotfiles. I use a "bare" repository to avoid symlinking from the cloned repo, all over my system.

Here are the commands I execute on a new system:

```
# Initialize a bare repo with its git internals stored in $HOME/.dotfiles
git init --bare $HOME/.dotfiles

# Create a alias that I can use to manage the bare repo, setting its worktree to $HOME
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Don't show all the untracked files in $HOME
config config status.showUntrackedFiles no
```

### Neovim config

My vim config is stored in https://github.com/koddsson/dotvim/ and brought into this repo via a submodule.

Further reading: https://mmdc.net/managing-dotfiles-with-a-bare-repository/
