if !exists('g:nvimjs_bundles')
  let g:nvimjs_bundles = '~/.vim/nvimjs_bundles'
endif

Plug 'tpope/vim-sensible'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'sirver/ultisnips'
Plug 'benekastah/neomake'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'nono/vim-handlebars'
Plug 'honza/vim-snippets'

Plug 'vimlab/split-term.vim'
