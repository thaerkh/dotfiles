" Vim filetype plugin file

nnoremap <F8> :call VimuxRunCommand("import ujson;print(ujson.dumps(<C-r>", indent=4))")<CR>

let g:jedi#show_call_signatures = 0
let g:test#python#pytest#options = '--capture=no'

let g:jedi#goto_assignments_command = "<localleader>g"
let g:jedi#goto_command             = "<localleader>c"
let g:jedi#rename_command           = "<localleader>r"
let g:jedi#usages_command           = "<localleader>l"
