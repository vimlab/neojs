let s:leaderKey = exists("&mapleader")?&mapleader:','

let s:padding = '                                         '
let s:padding .= '                                        '
let s:padding .= '                                        '
let s:padding .= '                                        '

" Unite integration menu

" Create a new menu
function! nvimjs#unite#candidates(unite_menu, empty_list)
  let l:empty_list = a:empty_list

  if empty(a:unite_menu)
    return l:empty_list
  endif

  for entry in a:unite_menu
    if type(entry) == 1
      let entry = substitute(entry, '\V<Leader>\c', '\1'.s:leaderKey, 'g')
    elseif type(entry) == 3
      let entry = nvimjs#unite#candidates(entry, [])
    endif

    call add(l:empty_list, entry)
  endfor

  return l:empty_list
endfunction

" Creates a new source
"
" - name: menu name
" - description: menu description
" - mapping: mapping right padded
" - candidates: a list of candidates
function! nvimjs#unite#source_menu(name, description, mapping, candidates)
  let source = {}
  let source.name = a:name
  let source.description = a:description
  let source.description .= s:padding[len(a:description):]
  let source.description .= a:mapping
  let source.command_candidates = copy(a:candidates)

  return source
endfunction

" Creates a new candidate for a menu
"
" - name
" - mapping
" - command
function! nvimjs#unite#create_candidate(name, mapping, command)
  return ['▷ ' . a:name . s:padding[len(a:name) + 3:] . '<Leader>' . a:mapping, a:command]
endfunction
