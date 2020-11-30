" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins list
call plug#begin()

" colorscheme
Plug 'ayu-theme/ayu-vim'
" denite
" Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" vista
Plug 'liuchengxu/vista.vim'
" gitgutter
Plug 'airblade/vim-gitgutter'
" statusline
Plug 'itchyny/lightline.vim'
" comment
Plug 'tyru/caw.vim'
" movement efficiently
Plug 'easymotion/vim-easymotion'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" pandoc's style markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" vim org-mode
Plug 'jceb/vim-orgmode'
" rubocop
Plug 'ngmy/vim-rubocop'

call plug#end()
