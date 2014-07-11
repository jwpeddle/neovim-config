setlocal softtabstop=4
setlocal shiftwidth=4

" Destroy EOL whitespace in python files
autocmd BufWrite *.py :silent! %s/\s\+$//

" Expand 'ppdb' to a pdb set trace
autocmd BufEnter *.py :iabbr ppdb import pdb;pdb.set_trace()
