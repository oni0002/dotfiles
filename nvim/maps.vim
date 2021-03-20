" ## Normal and Visual mode {{{
" c-s: save
nnoremap <c-s> :update<cr>
inoremap <c-s> <c-o>:update<cr>
nnoremap <leader>w :update<cr>
" l-q: quit
nnoremap <c-q> :q<cr>
inoremap <c-q> <esc>:q<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>
" c-x: close buffer
nnoremap <silent> <c-x> :bd<cr>

" jk:  exit I mode
inoremap jk <esc>
cnoremap jk <c-c>
" esc: exit T mode
tnoremap <esc> <c-\><c-n>

" Make Y behave like other capitals
nnoremap Y y$

" ;:  enter C mode
nnoremap ; :

" esc:  clear highlight
noremap <silent> <esc> :noh<cr>

" Do not exit visual after indenting
xnoremap > >gv
xnoremap < <gv
" tab/s-tab: indent
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" j/k visually
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" H/L: head/end
noremap H ^
noremap L $

" u/U: undo/redo
nnoremap U <c-r>

" l-z/Z: fold/unfold
noremap <leader>z za
noremap <leader>Z zA

" c-t/s/v: create new window in tab/hsplit/vsplit
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :split<cr>
nnoremap <c-w>v :vsplit<cr>

" c-h/j/k/l: switch window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" ]/[-b: switch next/prev buffer
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>

" ]/[-t: switch next/prev tab
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>
" }}}

" ## Insert and Command mode {{{
" c-f/b in I,C mode: forward/back
inoremap <c-f> <right>
inoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-b> <left>

" c-a/e/d in I,C mode: home/end
inoremap <c-a> <home>
inoremap <c-e> <end>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" }}}
