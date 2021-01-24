" leader key: <space>
let mapleader = "\<space>"
let maplocalleader = ','

" exit insert, terminal
inoremap jk <esc>
tnoremap <esc> <c-\><c-n>

nnoremap ; :

" write and quit
nnoremap <leader>w :update<cr>
nnoremap <leader>q :x<cr>
nnoremap <leader>Q :qa<cr>

" clear highlight
noremap <esc><esc> :<c-u>nohlsearch<cr>

" move cursor
noremap j gj
noremap k gk

" fast move
noremap H ^
noremap L $

" fold
noremap <leader>a za
noremap <leader>A zA

" insert new line below in normal mode
nnoremap <enter> o<esc>

" create window
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
nnoremap tl :tabn<cr>
nnoremap th :tabN<cr>

" move to sol/eol in insert mode
inoremap <c-a> <home>
inoremap <c-e> <end>

" hl in insert/command mode
inoremap <c-h> <left>
inoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
