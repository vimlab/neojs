
" Takes any number of String arguments, and append for each of them the
" correspoding `var stuff = require('stuff');` statement. In addition, if
" tabular is installed, it tries to align `=` in each of these added lines.
"
" Example:
"
"     :call s:require('fs', 'path', 'util', 'nopt')
"
" should append the following lines
"
"     var fs = require('fs');
"     var path = require('path');
"     var util = require('util');
"     var nopt = require('nopt');
let s:modules = []

" sindreshorus/builtin-modules
let s:script = 'var blacklist = ['
let s:script .= '"freelist",'
let s:script .= '"sys"'
let s:script .= '];'

let s:script .= 'console.log(Object.keys(process.binding("natives")).filter(function (el) {'
let s:script .= '	return !/^_|^internal|\//.test(el) && blacklist.indexOf(el) === -1;'
let s:script .= '}).sort().join(" "));'

function! s:filterModule(value, modules)
  return index(a:modules, a:value) == -1
endfunction

function! neojs#require(command)
  let args = split(a:command)

  if len(s:modules) == 0
    let s:modules = split(system("node -pe '" . s:script . "'"), ' ')
  endif

  let reqlist = map(copy(args), '"var " . v:val . " = require(''" . v:val . "'');"')

  let toinstall = filter(args, 's:filterModule(v:val, s:modules)')

  if(exists('*tabular#TabularizeStrings'))
    call tabular#TabularizeStrings(reqlist, '=')
  endif

  call append(line('.'), reqlist)

  if len(toinstall) != 0
    exe "Npmi " . join(toinstall, ' ')
  endif

  exe "wincmd j"
endfunction

" Completion function for npm
"
" Delegates to `npm completion`.
function! neojs#npmcomplete(lead, line, pos)
  " code
  let cmd = 'COMP_CWORD="0" COMP_LINE="' . a:lead . '" COMP_POINT="' . a:pos . '" npm completion -- "' . a:line . '"'
  return system(cmd)
endfunction
