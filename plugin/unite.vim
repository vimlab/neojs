let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

nnoremap [menu] <Nop>
nmap m  [menu]
nmap <LocalLeader>  [menu]
nmap <Leader>       [menu]

if !exists('g:unite_menu_prefix')
  let g:unite_menu_prefix = '<LocalLeader>'
  let g:unite_menu_prefix_value = g:mapleader
endif

call unite#custom#profile('default', 'context', {
\ 'no-start_insert': 1,
\ 'winheight': 7
\ })


" nnoremap <silent>[menu]g        :Unite -silent -start-insert menu:git<CR>
" nnoremap <silent>[menu]t        :Unite -silent -start-insert menu:vim<CR>

nnoremap <silent>[menu]m        :Unite -silent -winheight=3 -no-start-insert menu<CR>
nnoremap <silent>[menu]<Space>  :Unite -silent -no-start-insert menu<CR>
nnoremap <silent>[menu],        :Unite -silent -no-start-insert menu<CR>
