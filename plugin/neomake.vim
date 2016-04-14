let g:neojs_bundles = exists('g:neojs_bundles') ? g:neojs_bundles : '~/.vim/bundles'
let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

" ### Default makers
let g:neomake_javascript_enabled_makers = ['eslint', 'jscs']
let g:neomake_json_enabled_makers = ['jsonlint']

" Run neomake on save for js/json files
autocmd! BufWritePost *.js Neomake
autocmd! BufWritePost *.json Neomake

" Build Unite Menu
function! s:dirpath(val)
  return fnamemodify(a:val, ':t:r')
endfunction

" let s:makersDir = expand(g:neojs_bundles . '/neomake/autoload/neomake/makers/ft')
" let s:makers = split(glob(s:makersDir . '/*.vim'), '')
" let s:makers = map(s:makers, 's:dirpath(v:val)')

let s:candidates = []
let s:filetypes = ['javascript', 'json']

for ft in s:filetypes
  call add(s:candidates, neojs#unite#create_candidate(ft, 'm' . ft[:1], 'Neomake'))
endfor

let g:unite_source_menu_menus.lint = neojs#unite#source_menu('lint', 'Linter with neomake', 'm', s:candidates)
let g:unite_source_menu_menus.lint.command_candidates = neojs#unite#candidates(s:candidates, [])

nnoremap <silent>[menu]l :Unite -silent -start-insert menu:lint<CR>
