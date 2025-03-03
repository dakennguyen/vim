setlocal foldmethod=syntax

nmap <nowait><buffer> <c-s> o
nmap <nowait><buffer> <c-v> gO
nmap <nowait><buffer> <c-t> O

nnoremap <buffer> <leader>fo f/lvt<space>gf
nnoremap <buffer> <leader>fs f/lvt<space><c-w>f
nnoremap <buffer> <leader>fv '<cmd>lua require(utils.vsplit("f/lvt<space>gf")<cr>')
nnoremap <buffer> <leader>ft f/lvt<space><c-w>gf

nnoremap <buffer> cl :Git pull
nnoremap <buffer> cp :Git push
nnoremap <buffer> ch :Git fetch
nnoremap <buffer> cH :Git remote update origin --prune
nnoremap <buffer> cd<space> :vert Git diff<space>

nmap <silent> ]f /^diff --git<cr>zV
nmap <silent> [f ?^diff --git<cr>zV
