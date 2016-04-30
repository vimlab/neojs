let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

let g:neomake_javascript_eslint_maker = {
\ 'args': ['--env', 'es6', '-f', 'compact'],
\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
\ }

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']

" Run neomake on save for js/json files
autocmd! BufWritePost *.js Neomake
autocmd! BufWritePost *.json Neomake

" Build Unite Menu
function! s:dirpath(val)
  return fnamemodify(a:val, ':t:r')
endfunction

let s:candidates = []
let s:filetypes = ['javascript', 'json']

for ft in s:filetypes
  call add(s:candidates, neojs#unite#create_candidate(ft, 'm' . ft[:1], 'Neomake'))
endfor

let g:unite_source_menu_menus.lint = neojs#unite#source_menu('lint', 'Linter with neomake', 'm', s:candidates)
let g:unite_source_menu_menus.lint.command_candidates = neojs#unite#candidates(s:candidates, [])

nnoremap <silent>[menu]l :Unite -silent -start-insert menu:lint<CR>
