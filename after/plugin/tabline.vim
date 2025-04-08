set showtabline=2

" Define highlight groups based on the Normal background
let s:bg = synIDattr(hlID("Normal"), "bg", "gui")
" exe 'hi TabLine guibg=' . s:bg
" exe 'hi TabLineSel guibg=' . s:bg . ' gui=bold'
" exe 'hi TabLineFill guibg=' . s:bg . ' gui=underline'

function! s:cwd()
  let cwd = getcwd()
  let home = $HOME
  let special_dirs = {
        \ "\ue7b8 ": home . "/projects",
        \ "\uf015 ": home,
        \ }

  let prefix = ''
  let prefix_path = ''

  for [dir_name, dir_path] in items(special_dirs)
    let norm_path = fnamemodify(dir_path, ':p')
    if cwd =~ '^' . escape(norm_path, '\')
      if strlen(norm_path) > strlen(prefix_path)
        let prefix = dir_name
        let prefix_path = norm_path
      endif
    endif
  endfor

  let display_cwd = substitute(cwd, '^' . escape(prefix_path, '\'), prefix, '')
  let parts = split(display_cwd, '/')
  return join(parts, "\uf460 ") " 
endfunction

function! s:tabs_indicator()
  let s = ''
  let current = tabpagenr()
  let total = tabpagenr('$')

  for i in range(1, total)
    if i == current
      let s .= '%#TabLineSel# ' . i . ' '
    else
      let s .= '%#TabLine# ' . i . ' '
    endif
  endfor

  return s
endfunction

function! TablineRender()
  return s:cwd() . '%=' . s:tabs_indicator()
endfunction

set tabline=%!TablineRender()
