" Vim filetype plugin file

nnoremap <buffer> <F5> :call VimuxRunCommand("import ujson;print(ujson.dumps(<C-r>", indent=4))")<CR>
nnoremap <buffer> <localleader>e o__import__('ipdb').set_trace()<Esc>

let g:test#python#pytest#options = '--capture=no'
