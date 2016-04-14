let s:leaderKey = exists('&mapleader') ? &mapleader : ','
let s:localKey = exists('&maplocalleader') ? &maplocalleader : '<Space>'
let s:delimiter = exists('g:neojs_unite_delimiter') ? g:neojs_unite_delimiter : ' ❯ '

let s:padding = '                                         '
let s:padding .= '                                        '
let s:padding .= '                                        '
let s:padding .= '                                        '

" Unite integration menu

" Creates a new source
"
" - name: menu name
" - description: menu description
" - mapping: mapping right padded
" - candidates: a list of candidates
function! neojs#unite#source_menu(name, description, mapping, candidates)
  let source = {}
  let source.name = a:name
  let source.description = a:description
  let source.description .= s:padding[len(a:description):]
  let source.description .= s:leaderKey . a:mapping
  let source.command_candidates = copy(a:candidates)

  return source
endfunction

" Creates a new candidate for a menu
"
" - name
" - mapping
" - command
function! neojs#unite#create_candidate(name, mapping, command)
  return [s:delimiter . a:name . s:padding[len(a:name) + 3:] . s:leaderKey . a:mapping, a:command]
endfunction


function! neojs#unite#candidates(unite_menu, empty_list)
  let l:empty_list = a:empty_list

  if empty(a:unite_menu)
    return l:empty_list
  endif

  for entry in a:unite_menu
    if type(entry) == 1
      let entry = substitute(entry, '\V<Leader>\c', '\1'.s:leaderKey, 'g')
    elseif type(entry) == 3
      let entry = neojs#unite#candidates(entry, [])
    endif

    call add(l:empty_list, entry)
  endfor

  return l:empty_list
endfunction
