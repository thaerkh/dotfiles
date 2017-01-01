function! GetBetterJavaIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if getline(lnum) =~ '^\s*@\(\S\+\|\S\+(.*)\)\s*$'
    return indent(lnum)
  endif
  return GetJavaIndent()
endfunction
setlocal indentexpr=GetBetterJavaIndent()
