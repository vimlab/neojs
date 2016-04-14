let g:neojs_bundles = exists('g:neojs_bundles') ? g:neojs_bundles : '~/.vim/bundles'

let g:neojs_pluginfile = exists('g:neojs_pluginfile') ? g:neojs_pluginfile : g:neojs_bundles . '/neojs/docs/plugins.md'
let g:neojs_pluginfile = expand(g:neojs_pluginfile)

let s:installedfile = fnamemodify(g:neojs_pluginfile, ':h:h') . '/installed'
let s:installed = filereadable(s:installedfile)

if !s:installed
  echo 'Installing Bundles, please ignore key map error messages'
  echo ''

  let names = neojs#plug#init()
  call call('plug#load', names)

  autocmd VimEnter * PlugInstall
  call system('touch ' . s:installedfile)
else
  let names = neojs#plug#init()
  call call('plug#load', names)
endif

command! -complete=file -nargs=* PlugAdd  call neojs#plug#add(<q-args>)<CR>
