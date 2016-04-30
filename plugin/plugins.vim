" Globally loaded
Plug 'tpope/vim-sensible'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vimlab/split-term.vim'

" On demand loaded
Plug 'benekastah/neomake',        { 'for': 'javascript, json', 'do': 'npm install eslint jsonlint' }
Plug 'carlitux/deoplete-ternjs',  { 'for': 'javascript', 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim',       { 'for': 'javascript', 'do': 'npm install' }
Plug 'neovim/node-host',          { 'for': 'javascript', 'do': 'npm install' }
Plug 'moll/vim-node',             { 'for': 'javascript' }
Plug 'othree/yajs.vim',           { 'for': 'javascript' }
Plug 'pangloss/vim-javascript',   { 'for': 'javascript' }
Plug 'nono/vim-handlebars',       { 'for': 'handlebars' }

let g:neojs_bundles = exists('g:neojs_bundles') ? g:neojs_bundles : '~/.config/nvim/bundles'
let s:installedfile = fnamemodify(g:neojs_bundles, ':p') . '/neojs/installed'
let s:installed = filereadable(s:installedfile)

if !s:installed
  echo 'Installing Bundles, please ignore key map error messages'
  echo ''

  autocmd VimEnter * NeoJSInstall
  call system('touch ' . s:installedfile)
endif

command! NeoJSInstall  call neojs#plug#init()<CR>
