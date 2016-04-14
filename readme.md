<h1 align="center">
	<img width="360" src="./nvim.js.png" alt="nvim.js">
	<br>
	<br>
</h1>

> Lightweight bag of utilities for NeoVim JavaScript developers

---

Set of plugins and sensible defaults for JavaScript development with [neovim][]

- Takes advantage of Neovim's async features
- Sensible defaults for linting JSON & JS files
- Shortcuts commands to interact with npm
- Ability to hit `Ctrl+R` to launch current file with node
- A bunch of UltiSnips snippets
- A good amount of templates (init new buffers with arbitrary content)
- Wrappers to popular JavaScript task runners like [Grunt] or [Gulp]
- Same goodies for popular JavaScript test runner such as [Mocha] or [Ava]

On regular vim, plugins specifically designed to work with nvim are disabled.
Further updates will provide fallbacks to VIM compatible solutions (like
switching out Neomake to Syntasic)

## Install

```
Plug 'mklabs/nvim.js', { 'do': 'npm install' }
```

nvim.js assumes [vim-plug] is used as a package manager.

The file `plugin/plugins.vim` uses vim-plug API to dynamically load the following plugins:

- **[vim-sensible][]** A universal set of defaults that (hopefully) everyone can agree on.
- **[outline][]** Outline is used to provide fuzzy finder like feature for
  various source
- **[neomake][]** Neovim's Syntasic equivalent. Asynchronous linting using Neovim's job-control functionality
- **[deoplete][]** Provides an asynchronous keyword completion system in the current buffer
- **[ternjs][]** [Tern][] based JavaScript editing support
- **[deoplete-ternjs][]** deoplete source for javascript using [Tern][]
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

When necessary, configuration for a given plugin can be found in
`config/<plugin>.vim` (ex. [config/neomake.vim](./config/neomake.vim)).

## Node

[vim-node][] already provides excellent support for node developement.

[plugin/node.vim](./plugin/node.vim) adds a few more goodies:

- `:NodeRun` command to open a vertical `:terminal` buffer with `node` command.
  The current buffer is executed and the result displayed.

- `Ctrl+R` is the default mapping to run `:NodeRun`

- `:Node <args>` opens a 2-lines horizontal buffer with node prompt.

## Snippets

A list of [UltiSnips][] snippets:

- Common snippets like `f)`, `()()` to create IIFE, `#!` to expand node
  shebang, `ok` for `Object.keys()`, `e`, `l` to expand `console.`

- ES6 snippets from https://github.com/isRuslan/vim-es6/tree/master/UltiSnips

- React snippets from https://github.com/bentayloruk/vim-react-es6-snippets

Run `:UltiSnipsEdit` to edit them or add additional ones.

## Templates

[t.vim][] is a small "template" or scaffolding tool.

It takes a list of template files from `~/.vim/templates` and use them to
initialize new buffer from predefined content.

Mustache like placeholders can be used to quickly jump from one item to
another. With a little more work, [t.vim][] will ask the user for values to
quickly replace `{{ var }}`.

See [templates/](./templates) directory to see the list of available
templates.

You can add more templates in `~/.vim/templates`. The filename is important:
Use `<language>.<ext>` for a generic template to use for a particular filetype.
Any other name can be used for a more specific template. `package.json` is a
good example.

## Grunt / Gulp / npm / mocha / ..


Grunt, Gulp, npm, mocha, ava all have their respective vim commands, similar to
what [Fugitive][] does for Git.

- `:Grunt <task>` to run `<task>` with Grunt. Assumes `grunt-cli` is installed
  and that the `grunt` command is available in your `$PATH`

- `:Gulp <task>` same as `:Grunt`

- `:Npm <command> [options]` Wrapper on top of `npm`.

- `:Npmi packages...` alias for `:Npm install <args> --save`, except that it opens
  an horizontal buffer with only two lines displayed.

- `:Mocha args...` run `mocha` and outputs the result. Mocha should be installed
  and available in `node_modules` (the command uses `node_modules/.bin/mocha`)

- `:Ava args...` same as `:Mocha`

## Configuration

No configuration! That's simpler like it.

[vim-plug]: https://github.com/junegunn/vim-plug
[Outline]: https://github.com/Shougo/unite.vim
[UltiSnips]: https://github.com/SirVer/ultisnips
[Neomake]: https://github.com/benekastah/neomake
[deoplete]: https://github.com/Shougo/deoplete.nvim
[Tern]: https://ternjs.net
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
[neovim]: https://github.com/neovim/neovim
[ava]: https://github.com/sindresorhus/ava
[Mocha]: https://mochajs.org/
[Grunt]: http://gruntjs.com/
[Gulp]: http://gulpjs.com/
[vim-sensible]: https://github.com/tpope/vim-sensible
