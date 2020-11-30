# disable fzf legacy keybinding which conflict with fish's command key
set -U FZF_LEGACY_KEYBINDINGS 0

# alias
alias vim nvim
alias brew "PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin command brew"

# abbr
## brew
abbr -a br brew
abbr -a brdoc brew doctor
abbr -a brupd brew update  # update
abbr -a brupg brew upgrade  # upgrade
abbr -a brsear brew search  # search
abbr -a brins brew install  # install
abbr -a brrm brew uninstall  # uninstall(remove)
abbr -a brcle brew cleanup  # clean
abbr -a brl brew list  # list
## brew cask
# abbr -a brc brew cask
# abbr -a brcupg brew cask upgrade  # upgrade
# abbr -a brcins brew cask install  # install 
# abbr -a brcrm brew cask uninstall  #uninstall
abbr -a brcl brew list --cask  # list
## apt
abbr -a apupd sudo apt update  # update
abbr -a apupg sudo apt upgrade  # upgrade
abbr -a apsear sudo apt search  # search
abbr -a apins sudo apt install  # install
abbr -a aprm sudo apt remove --purge  # uninstall(remove)
abbr -a apauto sudo apt autoremove
abbr -a apcle sudo apt clean  # clean
abbr -a apl sudo dpkg -l  # list
## pacman
abbr -a pac pacman
abbr -a pacup sudo pacman -Syyu  # update and upgrade
abbr -a pacsear sudo pacman -Ss  # search
abbr -a pacins sudo pacman -S  # install
abbr -a pacrm sudo pacman -Rs  # uninstall(remove)
abbr -a paccle sudo pacman -Scc  # clean
## git
abbr -a g git
abbr -a gadd git add -A
abbr -a gcom git commit -m
abbr -a greb git rebase
abbr -a gsta git status
abbr -a gpus git push
abbr -a glog git log --oneline
abbr -a gref git reflog
abbr -a gfet git fetch
abbr -a gres git reset
abbr -a gpul git pull

# rbenv
rbenv init - | source
