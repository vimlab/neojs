let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

" ### Default makers
let g:neomake_javascript_enabled_makers = ['eslint', 'jscs']
let g:neomake_json_enabled_makers = ['jsonlint']

" Unite

function! s:dirpath(val)
  return fnamemodify(a:val, ':t:r')
endfunction

let s:makersDir = expand(g:nvimjs_bundles . '/neomake/autoload/neomake/makers/ft')
let s:makers = split(glob(s:makersDir . '/*.vim'), '')
let s:makers = map(s:makers, 's:dirpath(v:val)')

let s:candidates = []

for maker in s:makers
 call add(s:candidates, nvimjs#unite#create_candidate(maker, 'n' . maker[0], 'Neomake ' . maker))
endfor

" call add(s:candidates, nvimjs#unite#create_candidate('git status (Fugitive)', 'gs', 'Gstatus'))

let g:unite_source_menu_menus.neomake = nvimjs#unite#source_menu('git', 'Neomake', 'n', s:candidates)
let g:unite_source_menu_menus.neomake.command_candidates = nvimjs#unite#candidates(s:candidates, [])
