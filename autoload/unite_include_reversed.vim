let s:save_cpo = &cpo
set cpo&vim

" sketch

let s:S = unite#util#get_vital().import('Data.String')

" identifiers of the current buffer, based indirectly on &iskeyword
" function! unite_include_reversed#identifiers()
function! s:tmp()
  let lines = getline('1', '$')
  for line in lines
    let identifiers = s:S.scan(line, '\K\+')
    echomsg string(identifiers)
    for identifier in identifiers
      let pos_before = getpos('.')
      if searchdecl(identifier, 'g') == 0
        let pos = getpos('.')
        call setpos('.', pos_before)
        echomsg string(pos)
      endif
    endfor
  endfor
endfunction
call s:tmp()

" TODO move this to vital
" function! s:iskeyword2regexp(iskeyword)
"   let x = a:iskeyword
"   let x = substitute(x, ',', '', 'g')
"   let x = substitute(x, '\d\+', '\=nr2char(submatch(0))', 'g')
"   return printf('\[%s\]', x)
" endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
