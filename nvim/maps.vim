" save
nnoremap <c-s> :update<cr>
inoremap <c-s> <c-o>:update<cr>
nnoremap <leader>w :update<cr>
" close
nnoremap <c-q> :q<cr>
inoremap <c-q> <esc>:q<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>
" close buffer
nnoremap <silent> <c-x> :bd<cr>
" exit I
inoremap jk <esc>
cnoremap jk <c-c>
" exit T
tnoremap <esc> <c-\><c-n>
" make Y more natural 
nnoremap Y y$
" enter C
nnoremap ; :
" clear hl
noremap <silent> <esc> :noh<cr>
" indent
noremap <tab> >gv
noremap <s-tab> <gv
" make j, k more natural
noremap j gj
noremap k gk
" head/end
noremap H ^
noremap L $
" redo
nnoremap U <c-r>
" fold/unfold
noremap <leader>z za
" new tab, split, vsplit
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :split<cr>
nnoremap <c-w>v :vsplit<cr>
" switch window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" next/prev buffer
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
" next/prev tab
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>
" forward/back in I, C
noremap! <c-f> <right>
noremap! <c-b> <left>
" home/end in I, C
noremap! <c-a> <home>
noremap! <c-e> <end>
