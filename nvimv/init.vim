" init.vim

" source $HOME/.config/nvim/opts.vim {{{
" python provider
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
endif
let g:loaded_python_provider = 0

" Leader key: <space>
let mapleader = "\<space>"
let maplocalleader = ','

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

set termguicolors

autocmd Filetype lua setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 softtabstop=2

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
" }}}

" source $HOME/.config/nvim/plugs.vim {{{
" --- Vim-plug {{{
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
" }}}

" --- plugins list
call plug#begin()
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafamadriz/friendly-snippets'
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
" motion
Plug 'ggandor/lightspeed.nvim'
" comment
Plug 'b3nj5m1n/kommentary'
" status/tab line
Plug 'hoob3rt/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" start
Plug 'mhinz/vim-startify'
" colorscheme
" Plug 'lynd2299/neg.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

let g:tokyonight_style = "night"
colorscheme tokyonight

" --- Plugin settings {{{
" --- Coc {{{
" global extensions
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-lists',
    \ 'coc-pairs',
    \ 'coc-lua',
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-pyright',
    \ 'coc-explorer',
    \ 'coc-tabnine',
    \ ]

let g:coc_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" rename
nmap <leader>rn <Plug>(coc-rename)

" format selected region
nmap <leader>f <Plug>(coc-format)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>a  <Plug>(coc-codeaction)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <c-e> :<c-u>CocCommand explorer<cr>
" Autoclose when coc-explorer left alone
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
let g:coc_snippet_next = '<tab>'
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" }}}

" --- Telescope {{{
lua << EOF
require('telescope').setup{
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top"
        },
    }
}
require('telescope').load_extension('coc')
EOF
nnoremap [Tele] <nop>
nmap <leader><leader> [Tele]
xmap <leader><leader> [Tele]

nnoremap <silent> [Tele]f <cmd>Telescope find_files<cr>
nnoremap <silent> [Tele]h <cmd>Telescope oldfiles<cr>
nnoremap <silent> [Tele]b <cmd>Telescope buffers<cr>
nnoremap <silent> [Tele]w <cmd>Telescope live_grep<cr>
nnoremap <silent> [Tele]; <cmd>Telescope commands<cr>
nnoremap <silent> [Tele]l <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> [Tele]m <cmd>Telescope keymaps<cr>
nnoremap <silent> [Tele]? <cmd>Telescope help_tags<cr>
" Telescope coc
nnoremap <silent> [Tele]c; <cmd>Telescope coc commands<cr>
nnoremap <silent> [Tele]cd <cmd>Telescope coc diagnostics<cr>
nnoremap <silent> [Tele]ca <cmd>Telescope coc code_actions<cr>
" }}}

" --- kommentary {{{
lua << EOF
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
EOF
"  }}}

" --- Startify: {{{
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
" let g:startify_custom_header = startify#center(split(system('figlet -f tengwar -w 100 neovim'), '\n'))
let g:startify_custom_header = startify#center(split(system('figlet -f ntgreek -w 100 neovim'), '\n'))

let g:startify_lists = [
    \ {'type': 'commands', 'header': ['   Commands']},
    \ {'type': 'bookmarks', 'header': ['   Bookmarks']},
    \ ]

" commands
let g:startify_commands = [
    \ { 'f': [ 'Find files', ':Telescope find_files' ] },
    \ { 'h': [ 'Recentry', ':Telescope oldfiles' ] },
    \ { 'w': [ 'Find words', ':Telescope live_grep' ] },
    \ { 'up': [ 'Update Plugins', ':PlugUpgrade | :PlugUpdate' ] },
    \ { 'cp': [ 'Clear Plugins', ':PlugClean' ] },
    \ { 'uc': [ 'Update Coc', ':CocUpdate' ] },
    \ ]

" bookmarks
let g:startify_bookmarks = [
    \ { 'i': '~/dotfiles/nvim/init.vim' },
    \ ]
" }}}

" --- Statusline {{{
lua << EOF
require('tabline').setup({
    enable = false,
    options = {
        section_separators = {'', ''},
        -- component_separators = {'', ''},
        component_separators = {'', ''},
    }
})

require('lualine').setup {
    options = {
        theme = 'tokyonight',
        section_separators = {left = '', right = ''},
        -- component_separators = {'', ''},
        component_separators = {'', ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch', icon = ""},
        },
        lualine_c = {
            {'filename'},
            -- {'diagnostics', sources = {'lsp'}, sections = {'error', 'warn'}}
            {'diagnostics', sources = {'coc'}, sections = {'error', 'warn'}}
        },
        lualine_x = {'file_format', 'encoding', 'filetype', 'location'},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { require('tabline').tabline_buffers },
        lualine_x = { require('tabline').tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
}
EOF
" }}}
" }}}

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
" }}}

" source $HOME/.config/nvim/maps.vim {{{
" save
nnoremap <c-s> :update<cr>
inoremap <c-s> <c-o>:update<cr>
" close
nnoremap <c-q> :q<cr>
inoremap <c-q> <esc>:q<cr>
" close buffer
" nnoremap <silent> <c-x> :bd<cr>
" exit I
inoremap jk <esc>
cnoremap jk <c-c>
" exit T
tnoremap <esc> <c-\><c-n>
" make Y more natural 
nnoremap Y y$
" enter C
nnoremap ; :
nnoremap : ;
" new tab, split, vsplit
nnoremap <c-w>t :tabnew<cr>
nnoremap <c-w>s :sp<cr>
nnoremap <c-w>v :vs<cr>
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
" redo
nnoremap U <c-r>
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
" fold/unfold
noremap <leader>z za
" forward/back in I, C
noremap! <c-f> <right>
noremap! <c-b> <left>
" home/end in I, C
noremap! <c-a> <home>
noremap! <c-e> <end>
" }}}

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
