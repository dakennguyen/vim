silent! unmap <buffer> mp
silent! unmap <buffer> <c-l>

nnoremap <buffer> ? :help netrw-quickmap<CR>
nmap <buffer> <leader>0 <Plug>NetrwRefresh
vnoremap <buffer> mf :norm mf<cr>
