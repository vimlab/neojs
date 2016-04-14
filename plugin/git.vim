if !exists('g:unite_source_menu_menus')
  let g:unite_source_menu_menus = {}
endif

let s:source_menu = {}

let s:mappings = [
\ nvimjs#unite#create_candidate('mappings', 'm', 'Unite mapping -start-insert')
\]

let g:unite_source_menu_menus.vim = nvimjs#unite#source_menu('nvimjs menu', 'nvimjs', '<Leader>t', s:mappings)
let g:unite_source_menu_menus.vim.command_candidates = nvimjs#unite#candidates(s:mappings, [])

let s:candidates = []
call add(s:candidates, nvimjs#unite#create_candidate('git status (Fugitive)', 'gs', 'Gstatus'))
call add(s:candidates, nvimjs#unite#create_candidate('git diff (Fugitive)', 'gd', 'Gdiff'))
call add(s:candidates, nvimjs#unite#create_candidate('git commit (Fugitive)', 'gc', 'Gcommit'))
call add(s:candidates, nvimjs#unite#create_candidate('git lot (Fugitive)', 'gl', 'exe "silent Glog | Unite quickfix"'))
call add(s:candidates, nvimjs#unite#create_candidate('git blame (Fugitive)', 'gb', 'Gblame'))
call add(s:candidates, nvimjs#unite#create_candidate('git checkout (Fugitive)', 'gco', 'Gread'))
call add(s:candidates, nvimjs#unite#create_candidate('git rm (Fugitive)', 'grm', 'Gremove'))
call add(s:candidates, nvimjs#unite#create_candidate('git mv (Fugitive)', 'gmv', 'exe "Gmove " input("destination: ")'))
call add(s:candidates, nvimjs#unite#create_candidate('git push', 'gp', 'Git push'))
call add(s:candidates, nvimjs#unite#create_candidate('git pull', 'gP', 'Git pull'))

let g:unite_source_menu_menus.git = nvimjs#unite#source_menu('git', 'Fugitive menu', '<Leader>g', s:candidates)
let g:unite_source_menu_menus.git.command_candidates = nvimjs#unite#candidates(s:candidates, [])


nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
nnoremap <silent>[menu]t :Unite menu:vim -silent -start-insert<CR>
