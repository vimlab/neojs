let g:neojs_bundles = exists('g:neojs_bundles') ? g:neojs_bundles : '~/.config/nvim/bundles'
let s:installedfile = fnamemodify(g:neojs_bundles, ':p') . '/installed'
let s:installed = filereadable(s:installedfile)

if !s:installed
  echo 'Installing Bundles, please ignore key map error messages'
  echo ''


  Plug 'tpope/vim-sensible'
  Plug 'benekastah/neomake', { 'do': 'npm install eslint jsonlint' }
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'sirver/ultisnips'
  Plug 'neovim/node-host', { 'do': 'npm install' }
  Plug 'moll/vim-node'
  Plug 'othree/yajs.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'nono/vim-handlebars'
  Plug 'honza/vim-snippets'

  Plug 'vimlab/split-term.vim'

endif
