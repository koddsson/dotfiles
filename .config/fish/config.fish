set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $HOME/.bin $PATH
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.emacs.d/bin $PATH

set PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig"

# rbenv rehash >/dev/null ^&1

function __direnv_export_eval --on-event fish_prompt;
	"/usr/local/bin/direnv" export fish | source;
end

# Used for the bare dotfiles repo
alias config '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias cowork 'npx @koddsson/coworking-with'

# Don't greet me when I open up a terminal
set fish_greeting
