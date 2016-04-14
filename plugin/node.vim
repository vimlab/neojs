let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

" ### Require fs path
command! -complete=file -nargs=+ Require call neojs#require(<q-args>)

" ### Npm install qs
command! -complete=custom,neojs#npmcomplete -nargs=* Npm :Term npm <q-args>

" ### Npmi qs request
command! -complete=file -nargs=* Npmi :3Term npm install <args> --save

" ### Node app.js
command! -complete=file -count=2 -nargs=* Node :<count>Term node

" ### NodeRun
command! -nargs=* NodeRun call neojs#node#run()

" ### Ctrl+R to run the curent file with node
au BufEnter *.js nmap <C-r> :call neojs#node#run<CR>

let s:candidates = []

call add(s:candidates, neojs#unite#create_candidate('require', 'r', 'Require fs'))
call add(s:candidates, neojs#unite#create_candidate('npm', 'n', 'Npm'))
call add(s:candidates, neojs#unite#create_candidate('npmi', 'ni', 'Npmi'))
call add(s:candidates, neojs#unite#create_candidate('node run', 'nr  Ctrl+R', 'NodeRun'))
call add(s:candidates, neojs#unite#create_candidate('node', 'nn', 'Node'))

let g:unite_source_menu_menus.node = neojs#unite#source_menu('node', 'Node & npm menu', 'n', s:candidates)
let g:unite_source_menu_menus.node.command_candidates = neojs#unite#candidates(s:candidates, [])

nnoremap <silent>[menu]n :Unite -silent -start-insert menu:node<CR>
