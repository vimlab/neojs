
" Test runner helpers

let s:candidates = []

" Mocha
call add(s:candidates, neojs#unite#create_candidate('mocha --ui bdd',        'tm',  'Term mocha --ui bdd'))
call add(s:candidates, neojs#unite#create_candidate('mocha --ui tdd',        'tmt', 'Term mocha --ui tdd'))
call add(s:candidates, neojs#unite#create_candidate('mocha --ui exports',    'tmx', 'Term mocha --ui exports'))
call add(s:candidates, neojs#unite#create_candidate('mocha --help',          'tmh', 'Term mocha --help'))
call add(s:candidates, neojs#unite#create_candidate('mocha --interfaces',    'tmi', 'Term mocha --interfaces'))
call add(s:candidates, neojs#unite#create_candidate('mocha --reporters',     'tmr', 'Term mocha --reporters'))

" Ava
call add(s:candidates, neojs#unite#create_candidate('ava',           'ta',  'Term ava'))
call add(s:candidates, neojs#unite#create_candidate('ava --help',    'tap', 'Term ava --help'))
call add(s:candidates, neojs#unite#create_candidate('ava --init',    'tai', 'Term ava --init'))

let g:unite_source_menu_menus.test = neojs#unite#source_menu('test', 'Test helpers (Mocha & Ava)', 't', s:candidates)
let g:unite_source_menu_menus.test.command_candidates = neojs#unite#candidates(s:candidates, [])

nnoremap <silent>[menu]t :Unite -silent -start-insert menu:test<CR>
