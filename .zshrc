### Added by Zinit's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit installer's chunk

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
