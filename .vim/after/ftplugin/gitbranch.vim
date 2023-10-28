nnoremap <buffer> . : <c-r><c-a><s-left><left>
nnoremap <buffer> cb<space> :Git branch  <c-r><c-a><s-left><left>
nnoremap <buffer> co<space> :Git checkout  <c-r><c-a><s-left><left>
nnoremap <buffer> A :Git checkout -b  <c-r><c-a><s-left><left>
nnoremap <buffer> D :Git branch  <c-r><c-a><s-left><left>
nnoremap <buffer> R :Git branch -m <c-r><c-a>
nnoremap <buffer> rb :Git rebase <c-r><c-a><cr>
nnoremap <buffer> mf :Git merge <c-r><c-a><cr>
nnoremap <buffer> gl :Git log -n 5000 --oneline --date=short --pretty=format:'%h%d %s (%an)' <c-r><c-a><cr>
