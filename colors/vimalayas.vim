" Vimalayas - blue color scheme

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "vimalayas"


" Nord color palette
let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"


" Vimalayas palette
let s:italic = (has('nvim') || has('gui_running') || get(g:, 'vimalayas_italics', 0)) ? 'italic' : ''

let s:palette = {}
let s:palette.base = {'gui': s:nord0_gui, 'term': 'NONE'}
let s:palette.base01 = {'gui': s:nord1_gui, 'term': '0'}
let s:palette.base02 = {'gui': s:nord2_gui, 'term': '0'}
let s:palette.base03 = {'gui': s:nord3_gui, 'term': '8'}

let s:palette.white = {'gui': s:nord4_gui, 'term': 'NONE'}
let s:palette.white01 = {'gui': s:nord5_gui, 'term': '7'}
let s:palette.white02 = {'gui': s:nord6_gui, 'term': '15'}

let s:palette.none = {'gui': 'NONE', 'term': 'NONE'}

let s:palette.aqua = {'gui': s:nord7_gui, 'term': '14'}
let s:palette.teal = {'gui': s:nord8_gui, 'term': '6'}
let s:palette.blue = {'gui': s:nord9_gui, 'term': '4'}
let s:palette.dark_blue = {'gui': s:nord10_gui, 'term': '12'}
let s:palette.red = {'gui': s:nord11_gui, 'term': '1'}
let s:palette.orange = {'gui': s:nord12_gui, 'term': '11'}
let s:palette.yellow = {'gui': s:nord13_gui, 'term': '3'}
let s:palette.green = {'gui': s:nord14_gui, 'term': '2'}
let s:palette.violet = {'gui': s:nord15_gui, 'term': '5'}


if has('nvim') && (has("gui_running") || &termguicolors)
  let g:terminal_color_0 = s:palette.base01.gui
  let g:terminal_color_1 = s:palette.red.gui
  let g:terminal_color_2 = s:palette.green.gui
  let g:terminal_color_3 = s:palette.yellow.gui
  let g:terminal_color_4 = s:palette.blue.gui
  let g:terminal_color_5 = s:palette.violet.gui
  let g:terminal_color_6 = s:palette.teal.gui
  let g:terminal_color_7 = s:palette.white01.gui
  let g:terminal_color_8 = s:palette.base03.gui
  let g:terminal_color_9 = s:palette.red.gui
  let g:terminal_color_10 = s:palette.green.gui
  let g:terminal_color_11 = s:palette.yellow.gui
  let g:terminal_color_12 = s:palette.blue.gui
  let g:terminal_color_13 = s:palette.violet.gui
  let g:terminal_color_14 = s:palette.aqua.gui
  let g:terminal_color_15 = s:palette.white02.gui
endif

function! s:hi(group, fg_color, bg_color, attr, guisp) abort
    let arglist = []
    let highlight_args = {
                \ 'gui': a:attr,
                \ 'guifg': get(a:fg_color, 'gui', ''),
                \ 'guibg': get(a:bg_color, 'gui', ''),
                \ 'guisp': a:guisp,
                \ 'cterm': a:attr,
                \ 'ctermfg': get(a:fg_color, 'term', ''),
                \ 'ctermbg': get(a:bg_color, 'term', ''),
                \ }
    for [param, value] in items(highlight_args)
        if !empty(value)
            call add(arglist, param.'='.value)
        endif
    endfor
    if !empty(arglist)
        execute 'highlight' a:group join(arglist, ' ')
    endif
endfunction


call s:hi('Normal', s:palette.white, s:palette.base, '', '')
set background=dark

call s:hi('Constant', s:palette.blue, {}, '', '')
call s:hi('String', s:palette.blue, {}, '', '')
call s:hi('Number', s:palette.blue, {}, '', '')

call s:hi('Identifier', s:palette.white, {}, 'NONE', '')
call s:hi('Function', s:palette.blue, {}, '', '')

call s:hi('Statement', s:palette.blue, {}, '', '')
call s:hi('Operator', s:palette.blue, {}, 'NONE', '')
call s:hi('Keyword', s:palette.blue, {}, '', '')

call s:hi('PreProc', s:palette.blue, {}, 'NONE', '')

call s:hi('Type', s:palette.blue, {}, 'NONE', '')

call s:hi('Special', s:palette.aqua, {}, 'bold', '')
call s:hi('SpecialComment', s:palette.blue, {}, s:italic, '')

call s:hi('Title', s:palette.white, {}, 'NONE', '')
call s:hi('Todo', s:palette.aqua, s:palette.none, s:italic, '')
call s:hi('Comment', s:palette.base03, {}, s:italic, '')

call s:hi('LineNr', s:palette.base03, s:palette.base, '', '')
call s:hi('FoldColumn', s:palette.base03, s:palette.base, '', '')
call s:hi('CursorLine', {}, s:palette.base01, 'NONE', '')
call s:hi('CursorLineNr', s:palette.white, s:palette.base, '', '')

call s:hi('Visual', {}, s:palette.base02, '', '')
call s:hi('Search', s:palette.base01, s:palette.blue, 'NONE', '')
call s:hi('IncSearch', s:palette.base01, s:palette.aqua, 'NONE', '')

call s:hi('SpellBad', s:palette.red, s:palette.base, 'undercurl', s:palette.red.gui)
call s:hi('SpellCap', s:palette.yellow, s:palette.base, 'undercurl', s:palette.yellow.gui)
call s:hi('SpellLocal', s:palette.white02, s:palette.base, 'undercurl', s:palette.white02.gui)
call s:hi('SpellRare', s:palette.white02, s:palette.base, 'undercurl', s:palette.white02.gui)

call s:hi('Error', s:palette.base, s:palette.blue, '', '')
call s:hi('WarningMsg', s:palette.blue, s:palette.base, '', '')
call s:hi('ModeMsg', s:palette.white, {}, '', '')
call s:hi('MoreMsg', s:palette.white, {}, '', '')

call s:hi('MatchParen', s:palette.blue, s:palette.base03, '', '')

call s:hi('Cursor', s:palette.base, s:palette.white, '', '')
call s:hi('Underlined', s:palette.dark_blue, {}, 'underline', '')
call s:hi('SpecialKey', s:palette.base03, {}, '', '')
call s:hi('NonText', s:palette.base02, {}, '', '')
call s:hi('Directory', s:palette.blue, {}, '', '')

call s:hi('PMenu', s:palette.base, s:palette.blue, 'NONE', '')
call s:hi('PMenuSel', s:palette.base, s:palette.dark_blue, '', '')
call s:hi('PmenuSbar', {}, s:palette.base02, '', '')
call s:hi('PmenuThumb', {}, s:palette.white, '', '')

call s:hi('StatusLine', s:palette.blue, s:palette.base03, 'NONE', '')
call s:hi('StatusLineNC', s:palette.white, s:palette.base01, 'NONE', '')
call s:hi('WildMenu', s:palette.blue, s:palette.base01, '', '')
call s:hi('VertSplit', s:palette.base02, s:palette.base01, 'NONE', '')

call s:hi('DiffAdd', s:palette.base, s:palette.aqua, '', '')
call s:hi('DiffChange', s:palette.base, s:palette.dark_blue, '', '')
call s:hi('DiffDelete', s:palette.base, s:palette.red, '', '')
call s:hi('DiffText', s:palette.base, s:palette.blue, '', '')
call s:hi('DiffAdded', s:palette.aqua, s:palette.base, '', '')
call s:hi('DiffChanged', s:palette.dark_blue, s:palette.base, '', '')
call s:hi('DiffRemoved', s:palette.red, s:palette.base, '', '')

call s:hi('Bold', {}, {}, 'bold', '')
call s:hi('Underline', {}, {}, 'underline', '')
call s:hi('Italic', {}, {}, s:italic, '')

highlight! link Character Constant
highlight! link Float Number
highlight! link Boolean Number

highlight! link SignColumn FoldColumn
highlight! link ColorColumn FoldColumn
highlight! link CursorColumn CursorLine

highlight! link Folded LineNr
highlight! link Conceal Normal
highlight! link ErrorMsg Error

highlight! link Conditional Statement
highlight! link Repeat Statement
highlight! link Label Statement
highlight! link Exception Statement

highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro PreProc
highlight! link PreCondit PreProc

highlight! link StorageClass Type
highlight! link Structure Type
highlight! link Typedef Type

highlight! link SpecialChar Special
highlight! link Tag Special
highlight! link Delimiter Operator
highlight! link Debug Special
highlight! link Question Special

highlight! link VisualNOS Visual
highlight! link TabLine StatusLineNC
highlight! link TabLineFill StatusLineNC
highlight! link TabLineSel StatusLine
