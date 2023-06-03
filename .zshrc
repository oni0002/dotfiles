### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# suggestion
zinit light zsh-users/zsh-autosuggestions
# syntax highlight
zinit light zdharma/fast-syntax-highlighting

# history
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000

# ignore dup command
setopt hist_ignore_all_dups
# dont add the dup command to history
setopt hist_ignore_dups
# when save dup comamnd, delete a old command
setopt hist_save_no_dups
# remove extra blank
setopt hist_reduce_blanks
# if it isnt a command, do cd
setopt auto_cd
# complete )
setopt auto_param_keys
# complete / at end of directory
setopt auto_param_slash
# fuzzy complete
setopt auto_list
# display the filetype at completion list
setopt list_types
# complete dotfiles
setopt globdots
# if match to directory, add / at endline
setopt mark_dirs
# complete at a cursor
setopt complete_in_word
# show a list of files with keeping crusors
setopt always_last_prompt
# nobeep
setopt nobeep

# select a candidate with allowkey
zstyle ':completion:*:default' menu select=1
# also complete uppercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

