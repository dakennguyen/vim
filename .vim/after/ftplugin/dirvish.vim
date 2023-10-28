nmap <buffer> <leader>a gq

nnoremap <buffer><silent><nowait> t :call dirvish#open('tabedit', 0)<CR>
xnoremap <buffer><silent><nowait> t :call dirvish#open('tabedit', 0)<CR>
nnoremap <buffer><silent><nowait> o :call dirvish#open('split', 0)<CR>
nnoremap <buffer><silent><nowait> v :call dirvish#open('vsplit', 0)<CR>

nnoremap <buffer><silent><nowait> % <Plug>(dovish_create_file)
nnoremap <buffer><silent><nowait> d <Plug>(dovish_create_directory)
nnoremap <buffer><silent><nowait> D <Plug>(dovish_delete)
nnoremap <buffer><silent><nowait> R <Plug>(dovish_rename)
nnoremap <buffer><silent><nowait> yy <Plug>(dovish_yank)
xnoremap <buffer><silent><nowait> y <Plug>(dovish_yank)
nnoremap <buffer><silent><nowait> mc <Plug>(dovish_copy)
nnoremap <buffer><silent><nowait> mm <Plug>(dovish_move)

nmap <buffer><silent> <leader>fp :!open -a $MYBROWSER '<c-r><c-f>'<cr>
