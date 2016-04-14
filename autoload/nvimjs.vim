
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
"
function nvimjs#require(command)
  let reqlist = map(copy(split(a:command)), '"var " . v:val . " = require(''" . v:val . "'');"')
  if(exists('*tabular#TabularizeStrings'))
    call tabular#TabularizeStrings(reqlist, '=')
  endif
  call append(line('.') - 1, reqlist)
endfunction

" Completion function for npm
"
" Delegates to `npm completion`.
function! s:complete(lead, line, pos)
  " code
  let cmd = 'COMP_CWORD="0" COMP_LINE="' . a:lead . '" COMP_POINT="' . a:pos . '" npm completion -- "' . a:line . '"'
  return system(cmd)
endfunction
