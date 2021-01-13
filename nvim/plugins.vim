" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Automatic Installation {{{
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" }}}


" plugins list {{{
call plug#begin()


" General {{{
" coc {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" plugins for fuzzy find
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vim-clap'
Plug 'vn-ki/coc-clap'

" coc_status error/worning symbols
let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'

" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-pairs',
            \'coc-lists',
            \'coc-json',
            \'coc-python',
            \'coc-highlight',
            \'coc-explorer',
            \'coc-floaterm',
            \'coc-git',
            \'coc-tabnine',
            \]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
           \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc-lists
nmap <leader><leader> [clap]
xmap <leader><leader> [clap]
nnoremap <silent> [clap]f :<c-u>Clap files<cr>
nnoremap <silent> [clap]b :<c-u>Clap buffers<cr>
nnoremap <silent> [clap]c :<c-u>Clap command<cr>
nnoremap <silent> [clap]l :<c-u>Clap lines<cr>
nnoremap <silent> [clap]m :<c-u>Clap maps<cr>
nnoremap <silent> [clap]o :<c-u>Clap tags<cr>
nnoremap <silent> [clap]d :<c-u>Clap coc_diagnostics<cr>
nnoremap <silent> [clap]t :<c-u>Clap floaterm<cr>

" rename
nmap <leader>rn <Plug>(coc-rename)

" multi cursor
nmap <leader>m <Plug>(coc-cursors-word)

" format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" jk to select completion entry and <cr> to trigger the completion
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" coc-highlight
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-explorer
nnoremap <silent> <leader>e :<c-u>CocCommand explorer --quit-on-open<cr>
" Autoclose when coc-explorer left alone
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" }}}


" floaterm: {{{
Plug 'voldikss/vim-floaterm'

" floaterm width ratio
let g:floaterm_width = 0.8
" floaterm height ratio
let g:floaterm_height = 0.8
" autoclose floaterm when job exits normally
let g:floaterm_autoclose = 1
" open command for opening a file from floaterm 
let g:floaterm_open_command = 'vsplit'

" command to open lazygit
command! Lazygit FloatermNew lazygit
" command to open python shell, :FloatermSend to send selected lines to interactive shell
command! Pyshell FloatermNew python

" open new floaterm
nnoremap <silent> <F7> :<c-u>FloatermNew<cr>
tnoremap <silent> <F7> <c-\><c-n>:<c-u>FloatermNew<cr>
nnoremap <silent> <F8> :<c-u>FloatermPrev<cr>
tnoremap <silent> <F8> <c-\><c-n>:<c-u>FloatermPrev<cr>
nnoremap <silent> <F9> :<c-u>FloatermNext<cr>
tnoremap <silent> <F9> <c-\><c-n>:<c-u>FloatermNext<cr>
nnoremap <silent> <F12> :<c-u>FloatermToggle<cr>
tnoremap <silent> <F12> <c-\><c-n>:<c-u>FloatermToggle<cr>
" }}}


" vista {{{
Plug 'liuchengxu/vista.vim'

let g:vista_default_executive = 'coc'

" autoclose when vista left alone
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif

" ,o to toggle display outline
nnoremap <silent> <leader>o :<c-u>Vista!!<cr>
" }}}


" vim-easy-replace {{{
Plug 'kqito/vim-easy-replace'
" <leader>ra to replace
" <leader>rc to replace the words under the cursor
" }}}


" caw {{{
Plug 'tyru/caw.vim'

" toggle comment current line or selected line
nmap <leader>c <Plug>(caw:hatpos:toggle)
vmap <leader>c <Plug>(caw:hatpos:toggle)
" }}}


" easymotion {{{
Plug 'easymotion/vim-easymotion'

" disable easymotion default keymap
let g:EasyMotion_do_mapping = 0
" turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" jump to anywhere with 2 char
nmap s <Plug>(easymotion-overwin-f2)
" jump to word in current line
nmap f <Plug>(easymotion-bd-wl)
" search motion, n/N to next/prev match
nmap / <Plug>(easymotion-sn)
" line motion
nmap <leader>L <Plug>(easymotion-overwin-line)
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0
" }}}
" }}}


" Appearance {{{
" colorscheme {{{
Plug 'srcery-colors/srcery-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gkapfham/vim-vitamin-onec'
" }}}


" lightline {{{
" Plug 'itchyny/lightline.vim'
" 
" let g:lightline = {
"    \ 'active': {
"        \ 'left': [ [ 'mode', 'paste' ],
"            \ [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"    \ },
"    \ 'component_function': {
"        \ 'cocstatus': 'coc#status'
"    \ }
"\ }
" 
" " short mode name
" let g:lightline.mode_map = {
"        \ 'n' : 'N',
"        \ 'i' : 'I',
"        \ 'R' : 'R',
"        \ 'v' : 'V',
"        \ 'V' : 'VL',
"        \ "\<C-v>": 'VB',
"        \ 'c' : 'C',
"        \ 's' : 'S',
"        \ 'S' : 'SL',
"        \ "\<C-s>": 'SB',
"        \ 't': 'T',
"\ }
" let g:lightline.subseparator = { 'left': '', 'right': '' }
" }}}


" neoline {{{
Plug 'https://github.com/adelarsq/neoline.vim'
" }}}


" startify: {{{
Plug 'mhinz/vim-startify'

let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_custom_header =
           \'startify#center([
           \" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
           \" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
           \"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
           \"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
           \"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
           \"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
           \"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
           \"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
           \"         ░    ░  ░    ░ ░        ░   ░         ░   ",
           \"                                ░                  ",
           \])'

" commands
let g:startify_commands = [
           \{ 'pu': [ 'Update Plugins', ':PlugUpdate | PlugUpgrade' ] },
           \{ 'pc': [ 'Clean Plugins', ':PlugClean' ] },
           \{ 'cu': [ 'Update CoC Plugins', ':CocUpdate' ] },
           \]

" bookmarks
let g:startify_bookmarks = [
           \{ 'c': '~/dotfiles/nvim/init.vim' },
           \{ 'p': '~/dotfiles/nvim/plugins.vim' },
           \{ 'g': '~/.gitconfig' },
           \{ 'f': '~/dotfiles/fish/config.fish' }
           \]
" }}}
" }}}


" Language specific {{{
" simpylFold: {{{
" python fold
Plug 'tmhedberg/SimpylFold'
" }}}


" Markdown preview{{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" }}}


" Vim org-mode {{{
Plug 'jceb/vim-orgmode'

let g:org_export_emacs="/usr/local/bin/emacs"
" }}}


" Rubocop {{{
Plug 'ngmy/vim-rubocop'

augroup rubocop_fix
    autocmd!
    autocmd BufWritePost *.rb :RuboCop -A
augroup END
" }}}
" }}}


call plug#end()
" }}}


" colorscheme settings after loading plugins {{{
if (has("termguicolors"))
    set termguicolors
endif
syntax enable

colorscheme srcery
" let g:lightline.colorscheme = 'srcery'
" }}}
