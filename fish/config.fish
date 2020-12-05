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
abbr -a brls brew list  # list
## brew cask
abbr -a brcl brew list --cask  # list

## apt
abbr -a apupd sudo apt update  # update
abbr -a apupg sudo apt upgrade  # upgrade
abbr -a apsear sudo apt search  # search
abbr -a apins sudo apt install  # install
abbr -a aprm sudo apt remove --purge  # uninstall(remove)
abbr -a apauto sudo apt autoremove
abbr -a apcle sudo apt clean  # clean
abbr -a apls sudo dpkg -l  # list

## pacman
abbr -a pac pacman
abbr -a pacup sudo pacman -Syyu  # update and upgrade
abbr -a pacsear sudo pacman -Ss  # search
abbr -a pacins sudo pacman -S  # install
abbr -a pacrm sudo pacman -Rs  # uninstall(remove)
abbr -a paccle sudo pacman -Scc  # clean

## git
abbr -a g git
abbr -a gadd git add -A  # stage all changed file
abbr -a gbra git branch
abbr -a gcom git commit -m
abbr -a ggre git grep
abbr -a greb git rebase -i HEAD~  # summerize multi commits, need to push -f
abbr -a gsta git status
abbr -a gche git sheckout  # change branch or restore a file
abbr -a glog git log --graph
abbr -a gref git reflog  # operation log
abbr -a gfet git fetch  # fetch remote head
abbr -a gres git reset  # soft: cancel commit, mixed: in addition add, hard: in addition edit
abbr -a gpul git pull
abbr -a gls git ls-files

## fisher
abbr -a fiupd fisher update
abbr -a fiins fisher install
abbr -a firm fisher remove
abbr -a fils fisher ls

# rbenv
rbenv init - | source
