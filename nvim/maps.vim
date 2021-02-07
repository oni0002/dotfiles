" Leader key: <space>
let mapleader = "\<space>"
let maplocalleader = ','

" ## Normal and Visual mode

" c-s | save
nnoremap <c-s> :update<cr>
inoremap <c-s> <c-o>:update<cr>
nnoremap <leader>w :update<cr>
" l-q | quit
nnoremap <c-q> :q<cr>
inoremap <c-q> <esc>:q<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>
" c-x | close buffer
nnoremap <silent> <c-x> :bd<cr>

" jk to exit I mode
inoremap jk <esc>
cnoremap jk <c-c>
" esc to exit T mode
tnoremap <esc> <c-\><c-n>

" Make Y behave like other capitals
nnoremap Y y$

" ; to enter C mode
nnoremap ; :

" esc to clear highlight
noremap <silent> <esc> :noh<cr>

" Do not exit visual after indenting
xnoremap > >gv
xnoremap < <gv
" tab/s-tab indent
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" j/k visually
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" enter to add new line below
nnoremap <cr> o<esc>

" H/L to head/end
noremap H ^
noremap L $

" u/U to undo/redo
nnoremap U <c-r>

" l-z/Z to fold/unfold
noremap <leader>z za
noremap <leader>Z zA

" c-t/s/v to create new window in tab/hsplit/vsplit
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :split<cr>
nnoremap <c-w>v :vsplit<cr>

" c-h/j/k/l to switch window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" ]/[-b to switch next/prev buffer
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>

" ]/[-t to switch next/prev tab
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ## Insert and Command mode

" c-h/l/j/k in I mode to h/l/j/k
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>
" c-h/l in C mode to h/l
cnoremap <c-h> <left>
cnoremap <c-l> <right>

" c-a/e/d in I,C mode to home/end
inoremap <c-a> <home>
inoremap <c-e> <end>
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Commands {{{
" Sudo save
command! W w !sudo tee % > /dev/null
" }}}
