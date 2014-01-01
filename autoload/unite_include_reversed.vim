let s:save_cpo = &cpo
set cpo&vim

" sketch

let s:S = unite#util#get_vital().import('Data.String')
" let s:L = vital#of('vital').import('Data.List') " TODO

" identifiers of the current buffer, based indirectly on &iskeyword
function! unite_include_reversed#identifiers()
  let lines = getline('1', '$')
  for line in lines
    let identifiers = s:S.scan(s:remove_comment(line), '\K\+')
    for identifier in identifiers
      " let [found, pos] = s:searchdecl_pos(identifier, '')
      " if !found
      "   echomsg string(identifier)
      " else
      "   echomsg string(['found...', identifier, pos])
      " endif
    endfor
  endfor
endfunction

" TODO support languages besides Vim
function! s:remove_comment(line)
  return substitute(a:line, '"[^"]*$', '', '')
endfunction

" function! s:searchdecl_pos(name, global)
"   let pos_before = getpos('.')
"   if searchdecl(a:name, a:global) == 0
"     let pos = getpos('.')
"     call setpos('.', pos_before)
"     return [1, pos]
"   else
"     return [0, []]
"   endif
" endfunction

" TODO move this to vital
" function! s:iskeyword2regexp(iskeyword)
"   let x = a:iskeyword
"   let x = substitute(x, ',', '', 'g')
"   let x = substitute(x, '\d\+', '\=nr2char(submatch(0))', 'g')
"   return printf('\[%s\]', x)
" endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
