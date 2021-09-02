filetype plugin indent on

if (has("termguicolors"))
    set termguicolors
endif
syntax enable

set clipboard+=unnamedplus  " use system clipboard
set mouse=a  " enable mouse
set splitbelow splitright  " split window below/right
set nobackup  " do not make backup file
set nowritebackup
set noswapfile  " do not make swapfile
set noshowcmd  " do not show last command
set confirm  " confirm before close unsaved file
set updatetime=300  " default is 4000ms, too slow
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c  " do not pass messages to |ins-completion-menu|
set lazyredraw  " improve draw performance when navigating through large result

set ignorecase  " case insensitive search
set smartcase  " case sensitive if there is capital letter

set number  " show line num
set cursorline  " highlight current line
set showmatch  " highlight )
set signcolumn=yes  " always show signcolumn
set noshowmode  " do not show mode
set showbreak=>\   " show '> ' before break line
set scrolloff=7  " always 7 lines under cursor

set tabstop=4  " a tab is 4 spaces
set softtabstop=4  " <tab> inserts 4 spaces
set shiftwidth=4  " indent is 4 spaces
set expandtab  " use only space, not tab
set smartindent

set list  " show invisible chaeacter
set listchars=tab:>-,trail:⋅,extends:>,precedes:<

" Leader key: <space>
let mapleader = "\<space>"
let maplocalleader = ','

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
