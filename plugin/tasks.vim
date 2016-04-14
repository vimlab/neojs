" Task runner helpers
let s:candidates = []

" Grunt
call add(s:candidates, neojs#unite#create_candidate('grunt',          'bgr',   'Term grunt'))
call add(s:candidates, neojs#unite#create_candidate('grunt --help',   'bgrh',  'Term grunt --help'))
call add(s:candidates, neojs#unite#create_candidate('grunt --list',   'bgrl',  'Term grunt --list'))

" Gulp
call add(s:candidates, neojs#unite#create_candidate('gulp',           'bgul',  'Term ava'))
call add(s:candidates, neojs#unite#create_candidate('gulp help',      'bguh', 'Term ava --help'))

let g:unite_source_menu_menus.task = neojs#unite#source_menu('task', 'Task helpers (Grunt & Gulp)', 'b', s:candidates)
let g:unite_source_menu_menus.task.command_candidates = neojs#unite#candidates(s:candidates, [])

nnoremap <silent>[menu]t :Unite -silent -start-insert menu:task<CR>
