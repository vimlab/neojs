## Plugins

The file `plugin/plugins.vim` uses vim-plug API to dynamically load the following plugins:

- **[vim-sensible][]** A universal set of defaults that (hopefully) everyone can agree on.
- **[unite][]** Unite is used to provide fuzzy finder like feature for various source
- **[neomake][]** Neovim's Syntasic equivalent. Asynchronous linting using Neovim's job-control functionality
- **[deoplete][]** Provides an asynchronous keyword completion system in the current buffer
- **[ternjs][]** Tern based JavaScript editing support
- **[deoplete-ternjs][]** deoplete source for javascript using Tern
- **[vim-javascript][]** JavaScript bundle for vim, this bundle provides syntax and indent plugins
- **[yajs.vim][]** Yet Another JavaScript Syntax file
- **[es.next.syntax.vim][]** Syntax file is for ES7 and future syntax
- **[mdn.vim][]**  Query http://mdn.io and see the Markdown result in a vertical buffer
- **[jscs.vim][]** `jscs -x` command: `:Format` can take range or operate on the whole file
- **[split-term.vim][]** Utilites around neovim's `:terminal`
- **[vim-node][]** Tools to make Vim superb for developing with Node
- **[node-host][]** [Neovim's remote
  plugin](https://neovim.io/doc/user/remote_plugin.html) feature is kinda cool.
  It is now possible to author neovim plugins using JavaScript and node only.
  See [this page](./docs/remote-plugin.md) for more informations on how to
  create your own node plugin, or browse
  [mdown.vim](https://github.com/vimlab/mdown.vim) code which is an experiment
  on using neovim's and [node-host][] remote API.

[vim-sensible]: https://github.com/tpope/vim-sensible
[Unite]: https://github.com/Shougo/unite.vim
[UltiSnips]: https://github.com/SirVer/ultisnips
[Neomake]: https://github.com/benekastah/neomake
[deoplete]: https://github.com/Shougo/deoplete.nvim
[ternjs]: https://github.com/ternjs/tern_for_vim
[deoplete-ternjs]: https://github.com/carlitux/deoplete-ternjs
[vim-javascript]: https://github.com/pangloss/vim-javascript
[yajs.vim]: https://github.com/othree/yajs.vim
[es.next.syntax.vim]: https://github.com/othree/es.next.syntax.vim
[mdn.vim]: https://github.com/vimlab/mdn.vim
[jscs.vim]: https://github.com/vimlab/jscs.vim
[split-term.vim]: https://github.com/vimlab/split-term.vim
[vim-node]: https://github.com/moll/vim-node
[t.vim]: https://github.com/vimlab/t.vim
[node-host]: https://github.com/neovim/node-host
[Fugitive]: https://github.com/tpope/vim-fugitive
