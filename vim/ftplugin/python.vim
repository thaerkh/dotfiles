" Vim filetype plugin file

nnoremap <F2> :TestNearest<CR>
nnoremap <F3> :TestFile<CR>
nnoremap <F4> :call VimuxRunCommand('b <C-r>%:' . line('.'))<CR>

nnoremap <buffer> <localleader>i :call VimuxRunCommand("import ujson;print(ujson.dumps(<C-r>", indent=4))")<CR>
nnoremap <buffer> <localleader>e o__import__('ipdb').set_trace()<Esc>

let g:test#python#pytest#options = '--capture=no'
