" python provider
let g:python3_host_prog = '~/.venvs/nvimenv3/bin/python'
" let g:python_host_prog = expand('~/pynvim2/bin/python')
" leader key: ,
let mapleader = ','

" plugins
source ~/.config/nvim/plugins.vim
" plugin settings
source ~/.config/nvim/pluginrcs.vim
" keymap
source ~/.config/nvim/keymap.vim

" colorscheme
" colorscheme yowish
colorscheme ayu

set background=dark
set t_Co=256
set termguicolors

" don't automatically collapse markdown and LaTeX
set conceallevel=0
let g:tex_conceal = ""

" don't show current mode
set noshowmode

" automatically re-read file if change is detected
set autoread

" distinguish cases unless uppercase
set ignorecase
set smartcase

" hides buffers instead of closing them
set hidden

" statusline config
" set statusline+=%F
set cmdheight=1

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

filetype plugin indent on

" highlight )
set showmatch

" split below/right
set splitbelow splitright

" using system clipboard
set clipboard+=unnamedplus

" enable mouse
set mouse=a

" enable line num
set number

" highlight current line
set cursorline

" show invisible chara
set list

" dont make backupfile
set nobackup
" dont make swapfile
set noswapfile
" confilm when close unsaved file
set confirm
