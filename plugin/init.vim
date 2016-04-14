
" ## Configuration

" ### Default makers
let g:neomake_javascript_enabled_makers = ['eslint', 'jscs']
let g:neomake_json_enabled_makers = ['jsonlint']

" Run neomake on save for js/json files
autocmd! BufWritePost *.js Neomake
autocmd! BufWritePost *.json Neomake

" ## Commands

" ### Require fs path
command! -complete=file -nargs=+ Require call nvimjs#require(<q-args>)

" ### Npm install qs
command! -complete=custom,s:complete -nargs=* Npm :Term npm <q-args>

" ### Npmi qs request
command! -complete=file -nargs=* Npmi :3Term npm install <args> --save

" ### Node app.js
command! -complete=file -count=2 -nargs=* Node :<count>Term node

" ### NodeRun
command! -nargs=* -complete=file NodeRun call nvimjs#node#run

" ## Mappings

" ### Ctrl+R to run the curent file with node
au BufEnter *.js nmap <C-r> :call nvimjs#node#run<CR>
