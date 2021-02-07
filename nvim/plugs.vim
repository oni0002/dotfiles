" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" # vim-plug {{{
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


"# Plugins list {{{
call plug#begin()

" Functional
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary!'}
"Plug 'vn-ki/coc-clap'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'windwp/nvim-autopairs'

" Appearance
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'glepnir/indent-guides.nvim'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'

Plug 'kyazdani42/nvim-tree.lua'
"Plug 'glepnir/galaxyline.nvim'
"Plug 'akinsho/nvim-bufferline.lua'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'

" Colorscheme
Plug 'srcery-colors/srcery-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'fenetikm/falcon'

" Language specific 
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()
" }}}


" # Plugin settings {{{

" ## Coc.nvim {{{
" coc_status error/worning symbols
let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'

" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-lists',
            \'coc-json',
            \'coc-python',
            \'coc-explorer',
            \'coc-floaterm',
            \'coc-tabnine',
            \]

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
inoremap <silent><expr> <c-space> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
           \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

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
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


" coc-explorer
"nnoremap <silent> <leader>e :<c-u>CocCommand explorer --quit-on-open<cr>
" Autoclose when coc-explorer left alone
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" }}}

" ## Clap {{{
"let g:clap_layout = {'relative': 'editor'}

"nnoremap [clap] <Nop>
"nmap <leader><leader> [clap]
"nnoremap <silent> [clap]f :<c-u>Clap filer<cr>
"nnoremap <silent> [clap]b :<c-u>Clap buffers<cr>
"nnoremap <silent> [clap]c :<c-u>Clap command<cr>
"nnoremap <silent> [clap]l :<c-u>Clap lines<cr>
"nnoremap <silent> [clap]m :<c-u>Clap maps<cr>
"nnoremap <silent> [clap]o :<c-u>Clap tags<cr>
"nnoremap <silent> [clap]d :<c-u>Clap coc_diagnostics<cr>
"nnoremap <silent> [clap]t :<c-u>Clap floaterm<cr>
" }}}

" ## Telescope {{{
lua << EOF
require('telescope').setup{
    defaults = {
        prompt_position = "top",
        sorting_strategy = "ascending",
        file_sorter = require'telescope.sorters'.get_fzy_sorter,
        generic_sorter = require'telescope.sorters'.get_fzy_sorter
    }
}
EOF

nnoremap <silent> <leader><leader>f <cmd>Telescope find_files<cr>
nnoremap <silent> <leader><leader>h <cmd>Telescope oldfiles<cr>
nnoremap <silent> <leader><leader>b <cmd>Telescope buffers<cr>
nnoremap <silent> <leader><leader>c <cmd>Telescope commands<cr>
nnoremap <silent> <leader><leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <leader><leader>m <cmd>Telescope keymaps<cr>
nnoremap <silent> <leader><leader>t <cmd>Telescope treesitter<cr>
" }}}

" ## Floaterm {{{
" floaterm width ratio
let g:floaterm_width = 0.9
" floaterm height ratio
let g:floaterm_height = 0.9
" autoclose floaterm when job exits normally
let g:floaterm_autoclose = 1
" open command for opening a file from floaterm 
let g:floaterm_open_command = 'vsplit'

" command to open lazygit
command! Lazygit FloatermNew lazygit
" command to open python shell, :FloatermSend to send selected lines to interactive shell
command! Pyshell FloatermNew python

" open new floaterm
nnoremap <silent> <leader>t :<c-u>FloatermToggle<cr>
tnoremap <silent> <c-t> <c-\><c-n>:<c-u>FloatermToggle<cr>
tnoremap <silent> <c-h> <c-\><c-n>:<c-u>FloatermPrev<cr>
tnoremap <silent> <c-l> <c-\><c-n>:<c-u>FloatermNext<cr>
" }}}

" ## Vista {{{
let g:vista_default_executive = 'coc'

" autoclose when vista left alone
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif

" ,o to toggle display outline
nnoremap <silent> <leader>v :<c-u>Vista!!<cr>
" }}}

" ## NERDCommenter {{{
" Disable default keymap
let g:NERDCreateDefaultMappings = 0
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Toggle comment of selected lines
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle
" }}}

" ## Easymotion {{{
" disable easymotion default keymap
let g:EasyMotion_do_mapping = 0
" turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" jump to anywhere with 2 char
nmap s <Plug>(easymotion-overwin-f2)
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0
" }}}

" ## Clever-f {{{
" enable ignorecase
let g:clever_f_ignore_case = 1
" char for all symbol
let g:clever_f_chars_match_any_signs = ';'
" }}}

" ## Autopairs {{{
lua require('nvim-autopairs').setup()
" }}}

" ## TreeSitter {{{
"lua << EOF
"require'nvim-treesitter.configs'.setup {
"    ensure_installed = {},
"    highlight = { enable = true },
"}
"EOF
" }}}

" ## Gitsigns {{{
lua require('gitsigns').setup()
" }}}

" ## Lightline {{{
set showtabline=2

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1

let g:lightline = {
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'readonly', 'filename', 'modified' ],
            \ [ 'coc_errors', 'coc_warnings', ],
            \ [ 'coc_status' ] ]
    \ },
\ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
call lightline#coc#register()
" }}}

" ## Nvim Tree {{{
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>F :NvimTreeFindFile<cr>
" }}}

" ## Startify: {{{
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_custom_header = 'startify#center([
        \" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
        \" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
        \"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
        \"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
        \"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
        \"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
        \"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
        \"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
        \"         ░    ░  ░    ░ ░        ░   ░         ░   ",
        \"                                ░                  ",
        \])'

" commands
let g:startify_commands = [
        \{ 'pu': [ 'Update Plugins', ':PlugUpdate | PlugUpgrade' ] },
        \{ 'pc': [ 'Clean Plugins', ':PlugClean' ] },
        \{ 'cu': [ 'Update CoC Plugins', ':CocUpdate' ] },
        \]

" bookmarks
let g:startify_bookmarks = [
        \{ 'm': '~/dotfiles/nvim/maps.vim' },
        \{ 'p': '~/dotfiles/nvim/plugs.vim' },
        \{ 'f': '~/dotfiles/fish/config.fish' }
        \]
" }}}

" ## Indent-guides {{{
lua << EOF
require('indent_guides').setup({
    exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover','startify'}
})
EOF
" }}}

" ## Galaxyline {{{
"lua require('statusline')
" }}}

" }}}


" # Colorscheme settings {{{
if (has("termguicolors"))
    set termguicolors
endif
syntax enable

colorscheme moonfly
let g:lightline.colorscheme = 'moonfly'
" }}}
