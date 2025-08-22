" =============================================================================
"  Kanagawa (Deep Wave) – Darker Variant for Classic Vim (24-bit)
" =============================================================================
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'kanagawa'

if has('termguicolors')
  set termguicolors
endif

" ---------------------------------------------------------------------
" Darkened Palette
" ---------------------------------------------------------------------
let s:bg0   = '#0F0F18'
let s:bg1   = '#0A0A12'
let s:bg2   = '#1A1A22'
let s:bg3   = '#232333'
let s:fg0   = '#C8C093'
let s:fg1   = '#9E9B81'
let s:cmt   = '#5B5A50'
let s:purp  = '#8375A8'
let s:purp2 = '#857C9B'
let s:blue  = '#6E8FCF'
let s:blue2 = '#5B7684'
let s:aqua  = '#5A857A'
let s:green = '#8FAB5E'
let s:yellow= '#C78E4F'
let s:orange= '#E59450'
let s:red   = '#B03030'
let s:red2  = '#D02020'

let s:diff_add = '#1B2518'
let s:diff_chg = '#3B3630'
let s:diff_del = '#3A1A22'
let s:sel_bg   = '#1A2A39'
let s:menu_bg  = '#1D3B51'

" ---------------------------------------------------------------------
" Helper function
" ---------------------------------------------------------------------
function! s:Hi(group, guifg, guibg, attr)
  exec 'hi ' . a:group
        \ . (a:guifg != '' ? ' guifg=' . a:guifg : '')
        \ . (a:guibg != '' ? ' guibg=' . a:guibg : '')
        \ . (a:attr  != '' ? ' gui='   . a:attr  : '')
endfunction

" ---------------------------------------------------------------------
" UI Groups
" ---------------------------------------------------------------------
call s:Hi('Normal',       s:fg0,    s:bg0,      '')
call s:Hi('ColorColumn',  '',       s:bg1,      '')
call s:Hi('CursorLine',   '',       s:bg3,      '')
call s:Hi('CursorLineNr', s:yellow, '',         'bold')
call s:Hi('LineNr',       s:cmt,    '',         '')
call s:Hi('SignColumn',   '',       s:bg1,      '')
call s:Hi('VertSplit',    s:bg2,    '',         '')
call s:Hi('StatusLine',   s:fg0,    s:bg2,      '')
call s:Hi('StatusLineNC', s:fg1,    s:bg2,      '')
call s:Hi('Pmenu',        s:fg0,    s:menu_bg,  '')
call s:Hi('PmenuSel',     s:bg0,    s:purp,     'bold')
call s:Hi('Search',       s:bg0,    s:yellow,   '')
call s:Hi('IncSearch',    s:bg0,    s:orange,   'bold')
call s:Hi('Visual',       '',       s:sel_bg,   '')
call s:Hi('MatchParen',   s:red,    '',         'bold,underline')
call s:Hi('DiffAdd',      '',       s:diff_add, '')
call s:Hi('DiffChange',   '',       s:diff_chg, '')
call s:Hi('DiffDelete',   s:diff_del, s:bg0,    'bold')
call s:Hi('DiffText',     '',       s:sel_bg,   'bold')
call s:Hi('Directory',    s:blue,   '',         '')
call s:Hi('Error',        s:red2,   '',         'bold')
call s:Hi('ErrorMsg',     s:red2,   '',         'bold')
call s:Hi('WarningMsg',   s:orange, '',         '')
call s:Hi('MoreMsg',      s:green,  '',         '')
call s:Hi('Question',     s:yellow, '',         '')
call s:Hi('Tooltip',      s:fg0,    s:menu_bg,  '')

" ---------------------------------------------------------------------
" Syntax Highlighting
" ---------------------------------------------------------------------
call s:Hi('Comment',         s:cmt,   '',           'italic')
call s:Hi('Constant',        s:orange,'',           '')
call s:Hi('String',          s:green, '',           '')
call s:Hi('Character',       s:green, '',           '')
call s:Hi('Number',          s:yellow,'',           '')
call s:Hi('Boolean',         s:yellow,'',           '')
call s:Hi('Float',           s:yellow,'',           '')
call s:Hi('Identifier',      s:blue,  '',           '')
call s:Hi('Function',        s:blue,  '',           'bold')
call s:Hi('Statement',       s:purp,  '',           'bold')
call s:Hi('Conditional',     s:purp,  '',           '')
call s:Hi('Repeat',          s:purp,  '',           '')
call s:Hi('Label',           s:purp,  '',           '')
call s:Hi('Operator',        s:fg0,   '',           '')
call s:Hi('Keyword',         s:purp,  '',           'bold')
call s:Hi('Exception',       s:red,   '',           '')
call s:Hi('PreProc',         s:yellow,'',           '')
call s:Hi('Include',         s:yellow,'',           '')
call s:Hi('Define',          s:yellow,'',           '')
call s:Hi('Macro',           s:yellow,'',           '')
call s:Hi('PreCondit',       s:yellow,'',           '')
call s:Hi('Type',            s:aqua,  '',           '')
call s:Hi('StorageClass',    s:aqua,  '',           '')
call s:Hi('Structure',       s:aqua,  '',           '')
call s:Hi('Typedef',         s:aqua,  '',           '')
call s:Hi('Special',         s:red,   '',           '')
call s:Hi('SpecialChar',     s:red,   '',           '')
call s:Hi('Tag',             s:blue2, '',           '')
call s:Hi('Delimiter',       s:fg0,   '',           '')
call s:Hi('SpecialComment',  s:cmt,   '',           'italic')
call s:Hi('Debug',           s:red2,  '',           '')
call s:Hi('Underlined',      s:blue,  '',           'underline')
call s:Hi('Ignore',          s:cmt,   '',           '')
call s:Hi('Todo',            s:orange,'',           'bold,italic')

" ---------------------------------------------------------------------
" Terminal Colours
" ---------------------------------------------------------------------
if has('terminal')
  let g:terminal_ansi_colors = [
        \ '#0F0F18', '#B03030', '#8FAB5E', '#C78E4F',
        \ '#6E8FCF', '#8375A8', '#5A857A', '#C8C093',
        \ '#232333', '#D02020', '#8FAB5E', '#C78E4F',
        \ '#5B7684', '#857C9B', '#5A857A', '#C8C093'
        \ ]
endif
