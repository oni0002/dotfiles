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
" Plug 'neovim/nvim-lspconfig'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'nvim-lua/completion-nvim'
" Plug 'lukas-reineke/format.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'rhysd/clever-f.vim'
Plug 'windwp/nvim-autopairs'
Plug 'b3nj5m1n/kommentary'
Plug 'Konfekt/FastFold'

" Appearance
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'

Plug 'datwaft/bubbly.nvim'

" Colorscheme
Plug 'srcery-colors/srcery-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'fenetikm/falcon'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'co1ncidence/mountaineer.vim'

" Language specific 
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

call plug#end()
" }}}


" # Plugin settings {{{

" ## LSP {{{
" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" lua << EOF
" local nvim_lsp = require('lspconfig')
" local nvim_compe = require('completion')
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

"   require('completion').on_attach(client, bufnr)

"   -- Mappings.
"   local opts = { noremap=true, silent=true }
"   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

"   -- Set some keybinds conditional on server capabilities
"   if client.resolved_capabilities.document_formatting then
"     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"   elseif client.resolved_capabilities.document_range_formatting then
"     buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
"   end

"   -- Set autocommands conditional on server_capabilities
"   if client.resolved_capabilities.document_highlight then
"     vim.api.nvim_exec([[
"       hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
"       hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
"       hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
"       augroup lsp_document_highlight
"         autocmd! * <buffer>
"         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
"         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
"       augroup END
"     ]], false)
"   end
" end

" -- Use a loop to conveniently both setup defined servers 
" -- and map buffer local keybindings when the language server attaches
" local servers = { "pyright" }
" for _, lsp in ipairs(servers) do
"   nvim_lsp[lsp].setup { on_attach = on_attach }
" end

" require'format'.setup{
"     ["*"] = {
"         {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
"     },
"     python = {
"         {cmd={"balck"}}
"     }
" }
" EOF
" }}}

" ## Coc {{{
let g:ultisnips_python_style = 'google'
" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-lists',
            \'coc-json',
            \'coc-git',
            \'coc-pyright',
            \'coc-explorer',
            \'coc-floaterm',
            \'coc-tabnine',
            \]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
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
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

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


" ### Coc-explorer
nnoremap <silent> <leader>e :<c-u>CocCommand explorer --quit-on-open<cr>
" Autoclose when coc-explorer left alone
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" ### Coc-snippets
" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
let g:coc_snippet_next = '<tab>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" }}}

" ## Telescope {{{
" lua << EOF
" require('telescope').setup{
"     defaults = {
"         prompt_position = "top",
"         sorting_strategy = "ascending",
"         file_sorter = require'telescope.sorters'.get_fzy_sorter,
"         generic_sorter = require'telescope.sorters'.get_fzy_sorter
"     }
" }
" EOF
" nnoremap [Tele] <nop>
" nmap <leader><leader> [Tele]
" xmap <leader><leader> [Tele]

" nnoremap <silent> [Tele]f <cmd>lua require'telescope.builtin'.find_files()<cr>
" nnoremap <silent> [Tele]h <cmd>lua require'telescope.builtin'.oldfiles()<cr>
" nnoremap <silent> [Tele]b <cmd>lua require'telescope.builtin'.buffers()<cr>
" nnoremap <silent> [Tele]c <cmd>lua require'telescope.builtin'.commands()<cr>
" nnoremap <silent> [Tele]l <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>
" nnoremap <silent> [Tele]m <cmd>lua require'telescope.builtin'.keymaps()<cr>
" nnoremap <silent> [Tele]t <cmd>lua require'telescope.builtin'.treesitter()<cr>
" }}}

" ## Fzf {{{
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.8}}
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

nnoremap [Fzf] <nop>
nmap <leader><leader> [Fzf]
xmap <leader><leader> [Fzf]

nnoremap <silent> [Fzf]f :<c-u>Files<cr>
nnoremap <silent> [Fzf]h :<c-u>History<cr>
nnoremap <silent> [Fzf]b :<c-u>Buffers<cr>
nnoremap <silent> [Fzf]l :<c-u>BLines<cr>
nnoremap <silent> [Fzf]; :<c-u>Commands<cr>

nnoremap <silent> [Fzf]ca :<c-u>CocFzfList actions<cr>
nnoremap <silent> [Fzf]cd :<c-u>CocFzfList diagnostics --current-buf<cr>
nnoremap <silent> [Fzf]cs :<c-u>CocFzfList symbols<cr>
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
" nnoremap <silent> <c-t> :<c-u>FloatermToggle<cr>
" tnoremap <silent> <c-t> <c-\><c-n>:<c-u>FloatermToggle<cr>
" tnoremap <silent> <c-h> <c-\><c-n>:<c-u>FloatermPrev<cr>
" tnoremap <silent> <c-l> <c-\><c-n>:<c-u>FloatermNext<cr>
" }}}

" ## Vista {{{
let g:vista_default_executive = 'coc'

" autoclose when vista left alone
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif

" ,o to toggle display outline
nnoremap <silent> <leader>v :<c-u>Vista!!<cr>
" }}}

" ## Kommentary {{{
lua << EOF
require('kommentary.config').configure_language("python", {
    single_line_comment_string = "#",
    prefer_single_line_comments = true,
})
EOF
let g:kommentary_create_default_mappings = 0
nmap <silent> <leader>cc <Plug>kommentary_line_default
nmap <silent> <leader>c <Plug>kommentary_motion_default
vmap <silent> <leader>c <Plug>kommentary_visual_default
" }}}

" ## Easymotion {{{
" " disable easymotion default keymap
" let g:EasyMotion_do_mapping = 0
" " turn on case-insensitive feature
" let g:EasyMotion_smartcase = 1

" " jump to anywhere with 2 char
" nmap s <Plug>(easymotion-overwin-f2)
" " keep cursor column when JK motion
" let g:EasyMotion_startofline = 0
" }}}

" ## Clever-f {{{
" Enable ignorecase
let g:clever_f_ignore_case = 1
" Highlighting chars which can be directly jumped on
let g:clever_f_mark_direct = 1
" Char for all symbol
let g:clever_f_chars_match_any_signs = ';'
" }}}

" ## FastFold {{{
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 0
" }}}

" ## Autopairs {{{
lua require('nvim-autopairs').setup()
" }}}

" ## Bubbly {{{
let g:bubbly_palette = {
        \ 'background': "#000000",
        \ 'foreground': "#999999",
        \ 'black': "#000000",
        \ 'red': "#997a7a",
        \ 'green': "#85997a",
        \ 'yellow': "#99997a",
        \ 'blue': "#7a8599",
        \ 'purple': "#997a99",
        \ 'cyan': "#7a9999",
        \ 'white': "#cccccc",
        \ 'lightgrey': "#4d4d4d",
        \ 'darkgrey': "#333333",
    \ }
let g:bubbly_statusline = ['mode', 'truncate', 'path', 'branch', 'coc', 'divisor', 'filetype', 'progress']
" }}}

" ## Lightline {{{
"set showtabline=2

"let g:lightline#bufferline#show_number  = 1
"let g:lightline#bufferline#unnamed = '[No Name]'
"let g:lightline#bufferline#enable_devicons = 1

"let g:lightline = {
"    \ 'active': {
"        \ 'left': [ [ 'mode', 'paste' ],
"            \ [ 'readonly', 'filename', 'modified' ],
"            \ [ 'coc_errors', 'coc_warnings', ],
"            \ [ 'coc_status' ] ]
"    \ },
"\ }

"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}
"call lightline#coc#register()
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
" lua << EOF
" require('indent_guides').setup({
"     exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover','startify','floaterm','coc-explorer', 'fzf'}
" })
" EOF
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

func! s:moonfly_setup() abort
    hi DiffAdd ctermbg=bg ctermfg=10 guibg=bg guifg=#36c692
    hi DiffChange ctermbg=bg guibg=bg
    hi DiffDelete ctermbg=bg ctermfg=9 guibg=bg guifg=#ff5189 gui=none
    hi DiffText ctermbg=bg ctermfg=4 guibg=bg guifg=#80a0ff gui=none
endfunc

func! s:mountaineer_setup() abort
    hi CocErrorSign guifg=#ac8a8c
    hi CocWarningSign guifg=#aca98a
    hi CocInfoSign guifg=#8f8aac
    hi CocHintSign guifg=#8aac8b
endfunc

augroup color_change | au!
    " au ColorScheme moonfly call s:moonfly_setup()
    " au ColorScheme mountaineer call s:mountaineer_setup()
augroup END

colorscheme neg
" }}}

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
