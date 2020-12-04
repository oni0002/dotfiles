" leader key: ,
let mapleader = ','
let maplocalleader = '<'

" save
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

" clear highlight
noremap <leader><leader> :noh<cr>

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

" move cursor
noremap j gj
noremap k gk

" <cr> on normal mode to insert blank line below
nnoremap <cr> o<esc>

" move in insert/command mode
inoremap <c-h> <left>
inoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

" fast move
noremap H ^
noremap J }
noremap K {
noremap L $

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" scroll
noremap mj zb
noremap mk zt
noremap mm zz

" replace
nnoremap <leader>ra :%s///g<left><left><left>
nnoremap <leader>rc :%s///gc<left><left><left><left>

" exit insert
inoremap jk <esc>
tnoremap jk <c-\><c-n>
