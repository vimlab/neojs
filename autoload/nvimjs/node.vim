
" Run current file with node
function! nvimjs#node#run()
  let bufnr = expand('<bufnr>')
  let file = expand('%:p')

  exe 'Term node ' . file
endf

