" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" python provider {{{
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
endif
let g:loaded_python_provider = 0
" }}}

" options
source $HOME/.config/nvim/opts.vim
" keymap
source $HOME/.config/nvim/maps.vim
" plugins
source $HOME/.config/nvim/plugs.vim
