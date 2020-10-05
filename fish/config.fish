# disable fzf legacy keybinding which conflict with fish's command key
set -U FZF_LEGACY_KEYBINDINGS 0

# alias
alias v nvim
alias .. "cd .."
alias brew "PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin command brew"

# rbenv
rbenv init - | source
