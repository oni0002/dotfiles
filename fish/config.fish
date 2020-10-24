# disable fzf legacy keybinding which conflict with fish's command key
set -U FZF_LEGACY_KEYBINDINGS 0

# alias
alias vim nvim
alias brew "PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin command brew"

# abbr
abbr -a br brew
abbr -a bru brew update
abbr -a brg brew upgrade
abbr -a brc brew cleanup
abbr -a brd brew doctor

abbr -a g git
abbr -a gaa git add -A
abbr -a gcm git commit -m
abbr -a gcam git commit -a -m
abbr -a gp git push
abbr -a gs git status
abbr -a gl git log --oneline
abbr -a grl git reflog
abbr -a gp git push
abbr -a gpl git pull

abbr -a qiita qiita_org
# rbenv
rbenv init - | source
