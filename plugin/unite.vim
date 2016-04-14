let g:unite_source_menu_menus = exists('g:unite_source_menu_menus') ? g:unite_source_menu_menus : {}

if !exists('g:unite_menu_prefix')
  let g:unite_menu_prefix = '<LocalLeader>'
  let g:unite_menu_prefix_value = g:mapleader
endif


nnoremap <silent>[menu]g        :Unite -silent -start-insert menu:git<CR>
nnoremap <silent>[menu]t        :Unite -silent -start-insert menu:vim<CR>
nnoremap <silent>[menu]<Space>  :Unite -silent -start-insert menu<CR>
nnoremap <silent>[menu],        :Unite -silent -start-insert menu<CR>

