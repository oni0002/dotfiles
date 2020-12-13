" easy mapping rule
" <space>: general func
" <leader>: global plugin prefix
" <localleader>: language specific prefix
"

" leader key: ,
let mapleader = "\<space>"
let maplocalleader = '\'

nnoremap ; :

" save
nmap <leader>w :<c-u>w<cr>
nmap <leader>q :<c-u>q<cr>

" clear highlight
noremap <leader><leader><leader> :<c-u>nohlsearch<cr>

" move cursor
noremap j gj
noremap k gk

" fast move
noremap H ^
noremap J }
noremap K {
noremap L $

" fold
noremap <leader>a za
noremap <leader>A zA

" scroll
noremap mj zb
noremap mk zt
noremap mm zz

" <cr> on normal mode to insert blank line below
nnoremap <cr> o<esc>

" make window
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :split<cr>
nnoremap <c-w>v :vsplit<cr>

" focus window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" resize window
nnoremap - <c-w><c-->
nnoremap = <c-w><c-+>
nnoremap + <c-w><c->>
nnoremap _ <c-w><c-<>

" tab control
nnoremap tc :tabc<cr>
nnoremap tl :tabn<cr>
nnoremap th :tabN<cr>

" exit insert
inoremap jk <esc>
tnoremap JK <c-\><c-n>

" move to sol/eol in insert mode
inoremap <c-a> <home>
inoremap <c-e> <end>

" hl in insert/command mode
inoremap <c-h> <left>
inoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

" move on popup window
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
