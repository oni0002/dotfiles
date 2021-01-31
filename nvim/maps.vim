" Leader key: <space>
let mapleader = "\<space>"
let maplocalleader = ','
" Write and quit
nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>Q :qa!<cr>
" Sudo save
command! W w !sudo tee % > /dev/null
" Quick command
nnoremap <enter> :
" Clear highlight
noremap <silent> <esc><esc> :<c-u>nohlsearch<cr>
" Do not exit visual after indenting
vnoremap < <gv
vnoremap > >gv
" Move cursor
nmap j gj
nmap k gk
vmap j gj
vmap k gk
" Exit visual mode
vnoremap v <esc>
" Fast move
noremap H ^
noremap L $
" Redo
nnoremap U <c-r>
" <leader>z to fold
noremap <leader>z za
noremap <expr> <leader>Z $foldlevel ? 'zM' : 'zR'
" Create window
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :split<cr>
nnoremap <c-w>v :vsplit<cr>
" Buffer
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
" Tab
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>
" Window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Resize window
nnoremap - <c-w><c-<>
nnoremap + <c-w><c->>
nnoremap = <c-w><c-=>
" hl in insert/command mode
inoremap <c-h> <left>
inoremap <c-l> <right>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
" Insert/command mode map
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <delete>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <delete>
" Exit insert, terminal
inoremap jk <esc>
tnoremap <esc> <c-\><c-n>
