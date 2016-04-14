" Function helper to add a new plugin using vim-plug
function! neojs#plug#add(repo, opts)
  let plugin = split(a:repo, '/')[1]
  Plug a:repo, a:opts
endfunction

" Check whether a line in a markdown file is an URL definition
function! neojs#plug#check(line)
  return a:line[0] == '[' && match(a:line, 'https://github.com') != -1
endfunction

function! neojs#plug#line(line)
  let url = substitute(a:line, '\[.\+\]: ', '', 'g')
  let repo = substitute(url, 'https://github.com/', '', 'g')
  let name = split(repo, '/')[1]

  if name == ""
    let name = url
  endif

  return { 'name': name, 'url': url, 'repo': repo }
endfunction

function! neojs#plug#init()
  let plugins = readfile(g:neojs_pluginfile)
  let lines = filter(plugins, 'neojs#plug#check(v:val)')
  let plhgins = map(lines, 'neojs#plug#line(v:val)')
  let names = []

  for plugin in plugins
    let defaults = { 'do': 'npm install' }

    let opts = plugin.name == 'deoplete-ternjs' ? { 'do': 'npm install -g tern' } :
      \ plugin.name == 'tern_for_vim' ? defaults :
      \ plugin.name == 'node-host' ? defaults :
      \ plugin.name == 'neomake' ? { 'do': 'npm install eslint jscs jsonlint -g' } : {}

    call neojs#plug#add(plugin.repo, opts)
    call add(names, plugin.name)
  endfor

  return names
endfunction
