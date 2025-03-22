nmap <nowait><buffer> <c-s> o
nmap <nowait><buffer> <c-v> gO
nmap <nowait><buffer> <c-t> O

nnoremap <buffer> cl :Git pull
nnoremap <buffer> cp :Git push
nnoremap <buffer> ch :Git fetch
nnoremap <buffer> cH :Git remote update origin --prune
nnoremap <buffer> cd<space> :vert Git diff<space>
nnoremap <buffer> W :Git commit --no-verify<CR>
nnoremap <buffer> E :Git commit --amend --no-edit --no-verify

nnoremap <buffer> [ou :Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>
nnoremap <buffer> ]ou :Git branch -u origin/HEAD<CR>

nnoremap <buffer><silent> <leader>gd :vert Git diff origin/HEAD..HEAD<CR>

"function! s:open(cmd)
"  call execute(a:cmd)
"  quit
"  wincmd p
"endfunction

nnoremap <silent><buffer> <leader>gz :vsplit <bar> Gclog -g stash<CR>
nnoremap <silent><buffer> <leader>gc :vsplit <bar> Gclog -n 50<CR>
