"-----------
" coc.nvim
"-----------
" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-pairs',
            \'coc-lists',
            \'coc-json',
            \'coc-python',
            \'coc-markdownlint',
            \'coc-highlight',
            \'coc-explorer',
            \'coc-html',
            \'coc-css',
            \'coc-tsserver',
            \'coc-vimlsp',
            \'coc-vetur'
            \]
" coclist
nmap <leader>l :<c-u>CocList<cr>
" definition
nmap <leader>df <Plug>(coc-definition)
" reference
nmap <leader>rf <Plug>(coc-reference)
" rename current word
nmap <leader>rn <Plug>(coc-rename)
" format
nmap <leader>f <Plug>(coc-format)

" coc-explorer
nnoremap <c-e> :<c-u>CocCommand explorer --quit-on-open<cr>

" for insert a line when type <cr> between ()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" disable coc-pairs when open html
" autocmd FileType html let b:coc_pairs_disabled = ['']

"------------
" vista.vim
"------------
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_icon_indent = [" => ", " |-"]
let g:vista_default_executive = 'coc'
" map
" / to fzf
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<cr>
" ,vis to toggle vista window
nnoremap <silent> <leader>vis :<c-u>Vista!!<cr>


"----------------
" vim-gitgutter
"----------------
let g:gitgutter_enabled = 1


"------------
" lightline
"------------
let g:lightline = {
    \ 'colorscheme': 'ayu',
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
        \ 'cocstatus': 'coc#status'
    \ }
\ }


"----------
" caw.vim
"----------
" toggle comment current line or selected line
map <leader>/ <Plug>(caw:hatpos:toggle)


"-------------
" easymotion
"-------------
" disable caw default keymap
let g:EasyMotion_do_mapping = 0
" target keys by smartcase
let g:EasyMotion_smartcase = 1

" S{key}{key} to jump
nmap <leader>s <Plug>(easymotion-overwin-f2)


"-------------
" vim-orgmode
"-------------
let g:org_export_emacs="/usr/local/bin/emacs"

"-------------
" vim-rubocop
"-------------
autocmd BufWritePost *.rb :RuboCop -A
