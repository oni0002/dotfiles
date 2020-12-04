" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins list
call plug#begin()

" colorscheme{{{
    Plug 'ayu-theme/ayu-vim'
" }}}

" lightline{{{
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

" fzf{{{
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" }}}

" startify{{{
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
                \{ 'c': '~/.config/nvim/init.vim' },
                \{ 'g': '~/.gitconfig' },
                \{ 'f': '~/.fish/config.fish' }
                \]
" }}}

" COC {{{
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

    " navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " coc-list
    nmap <leader>l :<c-u>CocList<cr>

    "rename
    nmap <leader>rn <Plug>(coc-rename)

    " format selected region
    xmap <leader>f <Plug>(coc-format-selected)
    nmap <leader>f <Plug>(coc-format-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction


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

" vista {{{
    Plug 'liuchengxu/vista.vim'

    let g:vista_default_executive = 'coc'

    " / to fzf
    autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<cr>
    " ,vis to toggle vista window
    nnoremap <silent> <leader>vis :<c-u>Vista!!<cr>
" }}}

" gitgutter{{{
    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_enabled = 1
" }}}


" comment{{{
    Plug 'tyru/caw.vim'

    " toggle comment current line or selected line
    map <leader>/ <Plug>(caw:hatpos:toggle)
" }}}

" easymotion{{{
    Plug 'easymotion/vim-easymotion'

    " disable caw default keymap
    let g:EasyMotion_do_mapping = 0
    " target keys by smartcase
    let g:EasyMotion_smartcase = 1

    " S{key}{key} to jump
    nmap <leader>s <Plug>(easymotion-overwin-f2)
" }}}

" markdown preview{{{
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" }}}

" vim org-mode{{{
    Plug 'jceb/vim-orgmode'

    let g:org_export_emacs="/usr/local/bin/emacs"
" }}}

" rubocop{{{
    Plug 'ngmy/vim-rubocop'

    autocmd BufWritePost *.rb :RuboCop -A
" }}}

call plug#end()
