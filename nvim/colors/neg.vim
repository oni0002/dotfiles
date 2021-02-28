" ===============================================================
" neg
" 
" URL: 
" Author: 
" License: MIT
" Last Change: 2021/02/28 13:59
" ===============================================================

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="neg"


let Italic = ""
if exists('g:neg_italic')
  let Italic = "italic"
endif
let g:neg_italic = get(g:, 'neg_italic', 0)

let Bold = ""
if exists('g:neg_bold')
  let Bold = "bold"
endif

let g:neg_bold = get(g:, 'neg_bold', 0)
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi Conceal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE ctermfg=NONE guibg=#99997a ctermbg=246 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#0d0d0d ctermbg=232 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#0d0d0d ctermbg=232 gui=NONE cterm=NONE
hi CursorLineNr guifg=#99997a ctermfg=246 guibg=#0d0d0d ctermbg=232 gui=NONE cterm=NONE
hi Directory guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#66994d ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#4d9999 ctermfg=66 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#994d4d ctermfg=95 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#99994d ctermfg=101 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#994d4d ctermfg=95 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#1a1a1a ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#333333 ctermfg=236 guibg=#0d0d0d ctermbg=232 gui=NONE cterm=NONE
hi FoldColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#000000 ctermfg=0 guibg=#4d9999 ctermbg=66 gui=Bold cterm=Bold
hi LineNr guifg=#1a1a1a ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#999999 ctermfg=246 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi ModeMsg guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#262626 ctermfg=235 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi Normal guifg=#999999 ctermfg=246 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi PMenu guifg=#999999 ctermfg=246 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi PMenuSel guifg=#000000 ctermfg=0 guibg=#7a8599 ctermbg=102 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=#cccccc ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Question guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Search guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi SpecialKey guifg=#1a1a1a ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi SpellLocal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi SpellCap guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi SpellRare guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi StatusLine guifg=#999999 ctermfg=246 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi StatusLineNC guifg=#262626 ctermfg=235 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi TabLine guifg=#999999 ctermfg=246 guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=0 gui=NONE cterm=NONE
hi TabLineSel guifg=#4d4d4d ctermfg=239 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#1a1a1a ctermbg=234 gui=NONE cterm=NONE
hi WildMenu guifg=#333333 ctermfg=236 guibg=#7a8599 ctermbg=102 gui=NONE cterm=NONE
hi Comment guifg=#333333 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#997a99 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link Character Constant
hi link Boolean Constant
hi link Number Constant
hi link Float Constant
hi Identifier guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link Conditional Statement
hi link Repeat Statement
hi Label guifg=#999999 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi PreProc guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi Type guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi Special guifg=#99997a ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link SpecialChar Special
hi link Tag Special
hi Delimiter guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link SpecialComment Special
hi link Debug Special
hi Todo guifg=#994d4d ctermfg=95 guibg=NONE ctermbg=NONE gui=Bold cterm=Bold
hi CocErrorSign guifg=#994d4d ctermfg=95 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocWarningSign guifg=#99994d ctermfg=101 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocInfoSign guifg=#66994d ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocHintSign guifg=#4d9999 ctermfg=66 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi fzf1 guifg=#997a99 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi fzf2 guifg=#85997a ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi fzf3 guifg=#cccccc ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticDefaultError guifg=#994d4d ctermfg=95 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticDefaultWarning guifg=#99994d ctermfg=101 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticDefaultInformation guifg=#66994d ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticDefaultHint guifg=#4d9999 ctermfg=66 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH2 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH3 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH4 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH5 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH6 guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingDelimiter guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrderedListMarker guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#7a8599 ctermfg=102 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi markdownBold guifg=#e6e6e6 ctermfg=254 guibg=NONE ctermbg=NONE gui=Bold cterm=Bold
hi pythonDecoratorName guifg=#99997a ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi pythonBuiltin guifg=#99997a ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi pythonExceptions guifg=#997a99 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi pythonSelf guifg=#333333 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyNumber guifg=#997a99 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFile guifg=#999999 ctermfg=246 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyPath guifg=#4d4d4d ctermfg=239 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link StartifySlash Comment
hi link StartifyBracket Comment
hi link StartifySpecial Comment
hi StartifySection guifg=#997a7a ctermfg=8 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[color_foreground] = '#999999'
  let g:terminal_ansi_colors[color_background] = '#000000'
  let g:terminal_ansi_colors[color_0] = '#000000'
  let g:terminal_ansi_colors[color_1] = '#997a7a'
  let g:terminal_ansi_colors[color_2] = '#85997a'
  let g:terminal_ansi_colors[color_3] = '#99997a'
  let g:terminal_ansi_colors[color_4] = '#7a8599'
  let g:terminal_ansi_colors[color_5] = '#997a99'
  let g:terminal_ansi_colors[color_6] = '#7a9999'
  let g:terminal_ansi_colors[color_7] = '#cccccc'
  let g:terminal_ansi_colors[color_8] = '#333333'
  let g:terminal_ansi_colors[color_9] = '#994d4d'
  let g:terminal_ansi_colors[color_10] = '#66994d'
  let g:terminal_ansi_colors[color_11] = '#99994d'
  let g:terminal_ansi_colors[color_12] = '#4d6699'
  let g:terminal_ansi_colors[color_13] = '#994d99'
  let g:terminal_ansi_colors[color_14] = '#4d9999'
  let g:terminal_ansi_colors[color_15] = '#e6e6e6'
endif

if has('nvim')
  let g:terminal_color_color_foreground = '#999999'
  let g:terminal_color_color_background = '#000000'
  let g:terminal_color_color_0 = '#000000'
  let g:terminal_color_color_1 = '#997a7a'
  let g:terminal_color_color_2 = '#85997a'
  let g:terminal_color_color_3 = '#99997a'
  let g:terminal_color_color_4 = '#7a8599'
  let g:terminal_color_color_5 = '#997a99'
  let g:terminal_color_color_6 = '#7a9999'
  let g:terminal_color_color_7 = '#cccccc'
  let g:terminal_color_color_8 = '#333333'
  let g:terminal_color_color_9 = '#994d4d'
  let g:terminal_color_color_10 = '#66994d'
  let g:terminal_color_color_11 = '#99994d'
  let g:terminal_color_color_12 = '#4d6699'
  let g:terminal_color_color_13 = '#994d99'
  let g:terminal_color_color_14 = '#4d9999'
  let g:terminal_color_color_15 = '#e6e6e6'
endif

" ===================================
" Generated by Estilo 1.5.0
" https://github.com/jacoborus/estilo
" ===================================
