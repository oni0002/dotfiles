" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins list
call plug#begin()

" general functionality{{{
    " coc: Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode {{{
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " global extensions
        let g:coc_global_extensions = [
                    \'coc-snippets',
                    \'coc-pairs',
                    \'coc-lists',
                    \'coc-json',
                    \'coc-python',
                    \'coc-markdownlint',
                    \'coc-highlight',
                    \'coc-explorer',
                    \'coc-html',
                    \'coc-css',
                    \'coc-tsserver',
                    \'coc-vimlsp'
                    \]

        " Highlight the symbol and its references when holding the cursor.
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " goto code navigation
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-doHover)

        " navigate diagnostics
        " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " coc-list
        nnoremap <leader>lf :<c-u>CocList files<cr>
        nnoremap <leader>lc :<c-u>CocList commands<cr>
        nnoremap <leader>lm :<c-u>CocList maps<cr>
        nnoremap <leader>ld :<c-u>CocList diagnostics<cr>

        "rename
        nmap <leader>rn <Plug>(coc-rename)

        " format selected region
        xmap <leader>f <Plug>(coc-format-selected)
        nmap <leader>f <Plug>(coc-format-selected)

        " Remap keys for applying codeAction to the current buffer.
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Apply AutoFix to problem on the current line.
        nmap <leader>qf  <Plug>(coc-fix-current)


        " tab completion
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Make <CR> auto-select the first completion item and notify coc.nvim to
        " format on enter, <cr> could be remapped by other vim plugin
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

        " coc-explorer
        nnoremap <c-e> :<c-u>CocCommand explorer --quit-on-open<cr>
    " }}}

    " vista: 🌵 Viewer & Finder for LSP symbols and tags {{{
        Plug 'liuchengxu/vista.vim'
        " fzf is needed to search in vista
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'


        let g:vista_default_executive = 'coc'

        " / to fzf in vista window
        autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<cr>

        " autoclose when cista left alone
        autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif

        " ,o to toggle display outline
        nnoremap <silent> <leader>o :<c-u>Vista!!<cr>
    " }}}

    " vim-easy-replace: Vim plugin for quick and easy replacement {{{
        Plug 'kqito/vim-easy-replace'
        " <leader>ra to replace
        " <leader>rc to replace the words under the cursor
    " }}}

    " gitgutter: A Vim plugin which shows git diff markers in the sign column {{{
        Plug 'airblade/vim-gitgutter'

        let g:gitgutter_enabled = 1
    " }}}

    " fugitive: A Git wrapper so awesome, it should be illegal {{{
        Plug 'tpope/vim-fugitive'

        nnoremap <silent> <leader>gs :<c-u>Gstatus<cr>
        nnoremap <silent> <leader>ga :<c-u>Gwrite<cr>
        nnoremap <silent> <leader>gc :<c-u>Gcommit<cr>
        nnoremap <silent> <leader>gb :<c-u>Gblame<cr>
        nnoremap <silent> <leader>gd :<c-u>Gdiff<cr>
    " }}}

    " caw: vim comment plugin {{{
        Plug 'tyru/caw.vim'

        " toggle comment current line or selected line
        nnoremap <leader>/ <Plug>(caw:hatpos:toggle)
        vnoremap <leader>/ <Plug>(caw:hatpos:toggle)
    " }}}

    " easymotion: Vim motions on speed! {{{
        Plug 'easymotion/vim-easymotion'

        " disable easymotion default keymap
        let g:EasyMotion_do_mapping = 0
        " turn on case-insensitive feature
        let g:EasyMotion_smartcase = 1

        " jump to anywhere with 2 char
        nmap s <Plug>(easymotion-overwin-f2)
        " search motion, n/N to next/prev match
        nmap / <Plug>(easymotion-sn)
        " line motion
        nmap <leader>L <Plug>(easymotion-overwin-line)
        " keep cursor column when JK motion
        let g:EasyMotion_startofline = 0
    " }}}
" }}}


" Colorscheme/Appearance {{{
    " colorscheme {{{
        Plug 'ayu-theme/ayu-vim'
    " }}}

    " lightline: A light and configurable statusline/tabline plugin for Vim {{{
        Plug 'itchyny/lightline.vim'

        let g:lightline = {
            \ 'colorscheme': 'ayu',
            \ 'active': {
                \ 'left': [ [ 'mode', 'paste' ],
                    \ [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
                \ 'cocstatus': 'coc#status'
            \ }
        \ }
    " }}}

    " startify:🔗 The fancy start screen for Vim. {{{
        Plug 'mhinz/vim-startify'

        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_relative_path = 1
        let g:startify_use_env = 1
        let g:startify_custom_header =
                    \'startify#center([
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
                    \{ 'up': [ 'Update Plugins', ':PlugUpdate' ] },
                    \{ 'cp': [ 'Clean Plugins', ':PlugClean' ] },
                    \{ 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
                    \{ 'uc': [ 'Update CoC Plugins', ':CocUpdate' ] },
                    \]

        " bookmarks
        let g:startify_bookmarks = [
                    \{ 'c': '~/dotfiles/nvim/init.vim' },
                    \{ 'p': '~/dotfiles/nvim/plugins.vim' },
                    \{ 'g': '~/.gitconfig' },
                    \{ 'f': '~/dotfiles/fish/config.fish' }
                    \]
    " }}}
" }}}


" Language specific {{{
    " Markdown preview{{{
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " }}}

    " Vim org-mode {{{
        Plug 'jceb/vim-orgmode'

        let g:org_export_emacs="/usr/local/bin/emacs"
    " }}}

    " Rubocop {{{
        Plug 'ngmy/vim-rubocop'

        autocmd BufWritePost *.rb :RuboCop -A
    " }}}
" }}}

call plug#end()
