" # Vim-plug {{{
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

" # Plugins list {{{
call plug#begin()

" LSP and those replaced by COC {{{
" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'alexaandru/nvim-lspupdate'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Plug 'nvim-lua/completion-nvim'
" Plug 'lukas-reineke/format.nvim'

" Plug 'kyazdani42/nvim-tree.lua'

" Plug 'lewis6991/gitsigns.nvim'

" Plug 'windwp/nvim-autopairs'
" }}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'rhysd/clever-f.vim'
Plug 'b3nj5m1n/kommentary'
Plug 'Konfekt/FastFold'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'datwaft/bubbly.nvim'
" Plug 'tjdevries/express_line.nvim'
" Colorscheme
Plug 'lynd2299/neg.vim'
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

call plug#end()
" }}}

" # Plugin settings {{{
" LSP and those replaced by COC {{{
" ## LSP {{{
" lua << EOF
" local nvim_lsp = require('lspconfig')

" local servers = { "pyright" }

" for _, lsp in ipairs(servers) do
"   nvim_lsp[lsp].setup{}
" end

" require 'format'.setup{
"     python = {
"         { cmd = {"black", "isort"} }
"     }
" }
" EOF

" augroup Format
"     autocmd!
"     autocmd BufWritePost * FormatWrite
" augroup END

" " ### completion
" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " ### lspsaga
" lua << EOF
" require'lspsaga'.init_lsp_saga {
"     use_saga_diagnostic_sign = false,
"     finder_action_keys = {
"         open = '<cr>', vsplit = '<c-v>', split = '<c-x>', quit = '<c-c>', scroll_down = '<c-f>', scroll_up = '<c-b>'
"     },
"     border_style = 2
" }
" EOF

" " lsp provider to find the cursor word definition and reference
" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" " code action
" nnoremap <silent><leader>a <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent><leader>a <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>

" " show hover doc
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" " scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" " scroll up hover doc
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" " show signature help
" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" " rename
" nnoremap <silent> <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>

" " preview definition
" nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" " show
" nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" " jump diagnostic
" nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
" nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" }}}

" ## Gitsigns {{{
" lua require'gitsigns'.setup()
" }}}

" ## Nvim-tree {{{
" nnoremap <leader>e :NvimTreeToggle<cr>
" }}}

" ## Autopairs {{{
" lua require('nvim-autopairs').setup()
" }}}
" }}}

" ## Coc {{{
" ### coc config {{{
" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-pairs',
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

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
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" }}}

" ### Coc-explorer {{{
nnoremap <silent> <leader>e :<c-u>CocCommand explorer --quit-on-open<cr>
" Autoclose when coc-explorer left alone
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" }}}

" ### Coc-snippets {{{
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
nnoremap [Tele] <nop>
nmap <leader><leader> [Tele]
xmap <leader><leader> [Tele]

nnoremap <silent> [Tele]f <cmd>lua require'telescope.builtin'.find_files()<cr>
nnoremap <silent> [Tele]h <cmd>lua require'telescope.builtin'.oldfiles()<cr>
nnoremap <silent> [Tele]b <cmd>lua require'telescope.builtin'.buffers()<cr>
nnoremap <silent> [Tele]; <cmd>lua require'telescope.builtin'.commands()<cr>
nnoremap <silent> [Tele]l <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>
nnoremap <silent> [Tele]m <cmd>lua require'telescope.builtin'.keymaps()<cr>
" }}}

" ## Floaterm {{{
" floaterm border char
let g:floaterm_borderchars = '─│─│╭╮╯╰'
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
nnoremap <silent> <F12> :<c-u>FloatermToggle<cr>
tnoremap <silent> <F12> <c-\><c-n>:<c-u>FloatermToggle<cr>
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

" ## Clever-f {{{
" Enable ignorecase
let g:clever_f_ignore_case = 1
" Highlighting chars which can be directly jumped on
let g:clever_f_mark_direct = 1
" Char for all symbol
let g:clever_f_chars_match_any_signs = ';'
" }}}

" ## Statusline {{{
lua require('line')
" }}}

" ## Startify: {{{
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_custom_header = startify#pad([
            \"                                     d8,               ",
            \" +===============================+  `8P   +==========+ ",
            \"                                                       ",
            \"   88bd88b  d8888b d8888b ?88   d8P  88b  88bd8b,d88b  ",
            \"   88P' ?8bd8b_,dPd8P' ?88d88  d8P'  88P  88P'`?8P'?8b ",
            \"  d88   88P88b    88b  d88?8b ,88'  d88  d88  d88  88P ",
            \" d88'   88b`?888P'`?8888P'`?888P'  d88' d88' d88'  88b ",
            \" +===================================================+ ",
            \"",
            \"",
            \])

" commands
let g:startify_commands = [
        \{ 'up': [ 'Update Plugins', ':PlugUpdate | PlugUpgrade' ] },
        \{ 'cp': [ 'Clean Plugins', ':PlugClean' ] },
        \{ 'uc': [ 'Update Coc', ':CocUpdate' ] },
        \{ 'us': [ 'Update LS', ':LspUpdate' ] },
        \]

" bookmarks
let g:startify_bookmarks = [
        \{ 'm': '~/dotfiles/nvim/maps.vim' },
        \{ 'p': '~/dotfiles/nvim/plugs.vim' },
        \{ 'f': '~/dotfiles/fish/config.fish' }
        \]
" }}}

" ## SimpylFold {{{
let g:SimpylFold_docstring_preview = 1
" }}}
" }}}

colorscheme neg

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker
