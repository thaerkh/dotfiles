let mantle = "#000000"
let crust  = "#121212"
let teal   = "#5F8787"
let green  = "#5F875F"
let blue   = "#5F87AF"
let text   = "#FFFFFF"
let red    = "#E82424"
let yellow = "#E6C384"
let orange = "#FF5F00"

let cmantle =   0
let ccrust  = 232  " otherwise #080808 - for aligning tmuxline colors with shell prompt
let cteal   =  66
let cgreen  =  65
let cblue   =  67
let ctext   =  15
let cred    =   9
let cyellow =  11
let corange = 202

" Normal mode
let s:N1 = [mantle, green, cmantle, cgreen] " guifg guibg ctermfg ctermbg
let s:N2 = [green, crust, cgreen, ccrust] " guifg guibg ctermfg ctermbg
let s:N3 = [green, mantle, cgreen, cmantle] " guifg guibg ctermfg ctermbg

" Insert mode
let s:I1 = [mantle, teal, cmantle, cteal] " guifg guibg ctermfg ctermbg
let s:I2 = [teal, mantle, cteal, cmantle] " guifg guibg ctermfg ctermbg
let s:I3 = [text, mantle, ctext, cmantle] " guifg guibg ctermfg ctermbg

" Visual mode
let s:V1 = [mantle, blue, cmantle, cblue] " guifg guibg ctermfg ctermbg
let s:V2 = [blue, mantle, cblue, cmantle] " guifg guibg ctermfg ctermbg
let s:V3 = [text, mantle, ctext, cmantle] " guifg guibg ctermfg ctermbg

" Replace mode
let s:RE = [mantle, yellow, cmantle, cyellow] " guifg guibg ctermfg ctermbg

" Warning section
let s:WR = [mantle, orange, cmantle, corange]

" Error section
let s:ER = [mantle, red, cmantle, cred]

let g:airline#themes#dark#palette = {}

let g:airline#themes#dark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#dark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#dark#palette.insert_replace = {
  \ 'airline_a': [s:RE[0], s:I1[1], s:RE[1], s:I1[3], ''] }

let g:airline#themes#dark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let g:airline#themes#dark#palette.replace = copy(g:airline#themes#dark#palette.normal)
let g:airline#themes#dark#palette.replace.airline_a = [s:RE[0], s:RE[1], s:RE[2], s:RE[3], '']

let s:IA = [s:N1[1], s:N3[1], s:N1[3], s:N3[3], '']
let g:airline#themes#dark#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

let g:airline#themes#dark#palette.normal.airline_warning = s:WR
let g:airline#themes#dark#palette.insert.airline_warning = s:WR
let g:airline#themes#dark#palette.visual.airline_warning = s:WR

let g:airline#themes#dark#palette.normal.airline_warning_to_airline_error = s:WR
let g:airline#themes#dark#palette.insert.airline_warning_to_airline_error = s:WR
let g:airline#themes#dark#palette.visual.airline_warning_to_airline_error = s:WR

let g:airline#themes#dark#palette.normal.airline_error = s:ER
let g:airline#themes#dark#palette.insert.airline_error = s:ER
let g:airline#themes#dark#palette.visual.airline_error = s:ER
