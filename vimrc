let output =  system("defaults read -g AppleInterfaceStyle")
if v:shell_error != 0
  set background=light
else
  set background=dark
endif

let g:loaded_ruby_provider = 0

let g:loaded_2html_plugin = 1
let g:loaded_tohtml = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
" let g:loaded_matchit = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_tutor = 1
let g:loaded_rplugin = 1
let g:loaded_syntax = 1
let g:loaded_synmenu = 1
let g:loaded_optwin = 1
" let g:loaded_compiler = 1
let g:loaded_bugreport = 1
" let g:loaded_ftplugin = 1

" set tags=./tags;,tags;

call plug#begin()

" Group: Theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Group: TPope
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rsi'
Plug 'dakennguyen/vim-unimpaired'

" Group: Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Group: Editing support
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'github/copilot.vim'

" Group: Files manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Group: Navigator
Plug 'easymotion/vim-easymotion'

" Group: Git
Plug 'airblade/vim-gitgutter'

call plug#end()

" #############################################
" Section: Settings
" #############################################
filetype plugin indent on
syntax on

set nocompatible

set noswapfile
set number
set rnu
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoread
set smartindent
set autoindent
set wildmenu
set noshowmode
set encoding=UTF-8
set exrc                  " Enable reading local .nvimrc
set so=5                  " Scrolloff
set mouse=a               " Scroll with mouse
set belloff=all

" Theme
set encoding=utf8
set laststatus=2
set termguicolors
colorscheme gruvbox

" Fold
set foldenable
set foldlevelstart=5
set foldnestmax=5
set foldmethod=indent

" Search
set incsearch
set nohlsearch
" set inccommand=split
set ignorecase
set smartcase

" #############################################
" Section: Mappings
" #############################################

let mapleader = ','

nnoremap <space>ph :PlugStatus<cr>
nnoremap <space>ps :PlugUpdate<cr>
nnoremap <space>pi :PlugInstall<cr>
nnoremap <space>pc :PlugClean<cr>

" General
nnoremap <leader>0 :e<cr>
nnoremap <silent> <leader><space> :noh<cr>
nnoremap <silent> <leader>s :w<CR>
nnoremap <leader>a <C-^>
nnoremap <space>a :A<CR>
nnoremap <silent> <leader>w <C-w>
nnoremap ! :!
nnoremap 0 ^
noremap $ g_

" search
nnoremap <silent> # #<S-N>
nnoremap <silent> * *<S-N>
vnoremap # y?\V<C-R>=escape(@",'/\')<CR><CR><S-N>
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR><S-N>

" join and break line
nnoremap J mzJ`z
nnoremap <silent> K i<CR><ESC>l

" quit
nnoremap <silent> <leader>q :q<CR><C-W><C-P>
tnoremap <silent> <leader>q <C-\><C-N>:q<CR>

" gf
" nmap gdv <c-w>vgf
" nmap gds <c-w>f
" nmap gdt <c-w>gf

" Tab
nnoremap ]<tab> gt
nnoremap [<tab> gT
tnoremap ]<tab> <c-\><c-n>Ggt
tnoremap [<tab> <c-\><c-n>GgT
nnoremap <c-w><c-l> <cmd>+1tabmove<cr>
nnoremap <c-w>l <cmd>+1tabmove<cr>
nnoremap <c-w><c-h> <cmd>-1tabmove<cr>
nnoremap <c-w>h <cmd>-1tabmove<cr>
nnoremap <silent> <leader>t :tabnew<cr>
nnoremap <silent> <leader>x :tabclose<cr>

" Mark
nnoremap <expr> ' "'" . nr2char(getchar()) . "zt"
nnoremap <expr> ` "`" . nr2char(getchar()) . "zt"

" registers
noremap gp "0p
noremap gP "0P
noremap <leader>y "*y
noremap <leader>p "*p

" resize panes
nnoremap <silent> <Up>    :10winc +<CR>
nnoremap <silent> <Down>  :10winc -<CR>
nnoremap <silent> <Left>  :10winc <<CR>
nnoremap <silent> <Right> :10winc ><CR>

" session
nnoremap <space>ss :mksession! Session.vim<CR>
nnoremap <space>sq :mksession! Session.vim<CR>:qa<CR>
nnoremap <silent> <space>sl :source Session.vim<CR>

" zoom
nnoremap <leader>z <C-W>_<C-W><Bar>

" File
nnoremap <leader>fc :saveas <C-R>=expand("%")<CR>|                                 " File > Copy
nnoremap <silent> <leader>fyd :let @+=expand("%:h") \| echo @+<CR>|                " File > Yank > Directory Path
nnoremap <silent> <leader>fyy :let @+=expand("%") \| echo @+<CR>|                  " File > Yank > Relative File Path
nnoremap <silent> <leader>fyl :let @+=expand("%").":".line(".") \| echo @+<CR>|    " File > Yank > Relative File Path with Line number
nnoremap <silent> <leader>fyY :let @+=expand("%:p") \| echo @+<CR>|                " File > Yank > Full File Path
nnoremap <silent> <leader>fyn :let @+=expand("%:t:r") \| echo @+<CR>|              " File > Yank > File Name without extension
nnoremap <silent> <leader>fyN :let @+=expand("%:t") \| echo @+<CR>|                " File > Yank > File Name with extension
nnoremap <silent> <leader>fp :MarkdownPreview<CR>|                                 " File > Preview
nnoremap <silent> <leader>fyf ggVG"*y<c-o>

" Windows
nmap <silent> <left> :wincmd h<CR>
nmap <silent> <down> :wincmd j<CR>
nmap <silent> <up> :wincmd k<CR>
nmap <silent> <right> :wincmd l<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" quickfix and loclist
nnoremap <silent> <leader>c :copen<cr>
" nnoremap <silent> <leader>l :lopen<cr>

" #############################################
" Section: Plugins
" #############################################

"----------------------------------------------
" Plug 'alvan/vim-closetag'
"----------------------------------------------
let g:closetag_filenames = '*.html,*.jsx,*.js,*.erb'

"----------------------------------------------
" Plug 'tpope/vim-projectionist'
"----------------------------------------------
autocmd User ProjectionistDetect
      \ call projectionist#append(getcwd(),
      \ {
      \   'lib/*.rb': {
      \     'alternate': 'spec/lib/{}_spec.rb',
      \     'type': 'source',
      \   },
      \   'lib/*.rake': {
      \     'alternate': 'spec/lib/{}_rake_spec.rb',
      \     'type': 'source',
      \   },
      \   'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb',
      \     'type': 'source',
      \   },
      \   'spec/*_rake_spec.rb': {
      \     'alternate': '{}.rake',
      \     'type': 'spec',
      \   },
      \   'spec/*_spec.rb': {
      \     'alternate': [
      \       '{}.rb',
      \       'app/{}.rb'
      \     ],
      \     'type': 'spec',
      \   },
      \   '*.js': {
      \     'alternate': [
      \       '{dirname}/__tests__/{basename}.spec.js',
      \       '{dirname}/__tests__/integration.spec.js'
      \     ],
      \     'type': 'source',
      \   },
      \   '*/integration.spec.js':{
      \     'alternate': '{dirname}/index.js',
      \     'type': 'spec',
      \   },
      \   '*.spec.js': {
      \     'alternate': '{dirname}/../{basename}.js',
      \     'type': 'spec',
      \   },
      \ })

"----------------------------------------------
" Plug 'junegunn/fzf.vim'
"----------------------------------------------
let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
let $FZF_DEFAULT_OPTS=" --bind 'ctrl-d:preview-page-down,ctrl-u:preview-page-up'"
let g:fzf_preview_source=" --layout reverse --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
let g:fzf_layout = { 'down': '50%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
  \ {
  \   'fg':      ['fg', 'Normal'],
  \   'bg':      ['bg', 'Normal'],
  \   'hl':      ['fg', 'Comment'],
  \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \   'hl+':     ['fg', 'Statement'],
  \   'info':    ['fg', 'PreProc'],
  \   'border':  ['fg', 'Ignore'],
  \   'prompt':  ['fg', 'Conditional'],
  \   'pointer': ['fg', 'Exception'],
  \   'marker':  ['fg', 'Keyword'],
  \   'spinner': ['fg', 'Label'],
  \   'header':  ['fg', 'Comment']
  \ }

" Files
nnoremap <silent> <space>ff :Files<CR>
nnoremap <silent> <space>fv :Files ~/.dotfiles<CR>
nnoremap <silent> <space>fd :Files %:p:h<CR>
nnoremap <silent> <space>fb :Buffers<CR>
nnoremap <silent> <space>fo :History<CR>
nnoremap <silent> <space>fh :Helptags<CR>
nnoremap <silent> <space>fm :Maps<CR>
nnoremap <silent> <space>fc :History:<CR>

nnoremap <silent> <space>fs :Files local_scripts<CR>

" Search
nnoremap <silent> //           :BLines<CR>
nnoremap \                     :Rg<space>
nnoremap <silent> <space>fw   :Rg <C-R><C-W><CR>
vnoremap <space>fw           y:Rg <C-R>=escape(@",'/\')<CR><CR>

" Insert mode completion
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

"----------------------------------------------
" Plug 'easymotion/vim-easymotion'
"----------------------------------------------
nmap <silent> s <Plug>(easymotion-bd-f)

"----------------------------------------------
" Plug 'AndrewRadev/splitjoin.vim'
"----------------------------------------------
let g:splitjoin_split_mapping = 'gS'
let g:splitjoin_join_mapping  = 'gJ'

"----------------------------------------------
" Plug 'github/copilot.vim'
"----------------------------------------------
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <c-j> copilot#Accept("<CR>")

"----------------------------------------------
" Plug 'airblade/vim-gitgutter'
"----------------------------------------------
let g:gitgutter_sign_added               = '▌'
let g:gitgutter_sign_modified            = '▌'
let g:gitgutter_sign_modified_removed     = '▌'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed            = '▁'
nnoremap <leader>hp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>hs <Plug>(GitGutterStageHunk)
nnoremap <leader>hr <Plug>(GitGutterUndoHunk)

"---------------------------------------------------------------------------
" Plug 'neoclide/coc.nvim'
"---------------------------------------------------------------------------
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=auto

autocmd FileType scss setl iskeyword+=@-@

"# Extensions
let g:coc_global_extensions = [
      \  'coc-snippets',
      \  'coc-pairs',
      \  'coc-eslint',
      \  'coc-prettier',
      \  'coc-css',
      \  'coc-emmet',
      \  'coc-solargraph',
      \  'coc-sql',
      \  'coc-yaml',
      \  'coc-tsserver',
      \]

"# <CR> for Selection - fix conflict with endwise
let g:endwise_no_mappings = v:true
inoremap <expr> <Plug>CustomCocCR pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd

" Remap <C-d> and <C-u> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"# GoTo Code Navigation
nmap <silent> gdd <Plug>(coc-definition)
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit') <CR>
nmap <silent> gds :call CocAction('jumpDefinition', 'split') <CR>
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> gry <Plug>(coc-type-definition)
nmap <silent> gri <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)
nmap <silent> gra <Plug>(coc-action)
nnoremap <silent> <space>ll :call CocAction('diagnosticPreview')<CR>

"# Code Formatting
" vmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)
nmap <silent> <space>lf :call CocAction('format')<CR>

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"# Code Fixing
nmap <silent> <leader>ef <plug>(coc-fix-current)

"# Mappings for CoCList
" nnoremap <silent><nowait> <leader>a :<C-u>CocList diagnostics<cr>
" nnoremap <silent><nowait> <leader>x :<C-u>CocList extensions<cr>
" nnoremap <silent><nowait> <leader>c :<C-u>CocList commands<cr>
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> <leader>l :CocDiagnostics<cr>

"---------------------------------------------------------------------------
" Plug 'tpope/vim-dispatch'
"---------------------------------------------------------------------------
nnoremap <silent> <leader>C :Copen<cr>
nnoremap <silent> <space>C :Copen!<cr>
vnoremap `<space> :Dispatch<space>
vnoremap `<CR> :Dispatch<CR>
nnoremap t<C-n> mT<cmd>.Dispatch<CR>
nnoremap t<C-l> <cmd>Copen<bar>Dispatch<CR>
nnoremap t<C-g> 'T
let g:dispatch_no_tmux_start = 1
let g:dispatch_compilers = {
      \ 'python -m pytest': 'pytest',
      \ 'bundle exec spring': '',
      \ 'bundle exec': ''}

"---------------------------------------------------------------------------
" Plug 'itchyny/lightline.vim'
"---------------------------------------------------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ] ]
      \ },
      \ 'component': {
      \   'short_mode': '%{toupper(mode())}',
      \ },
      \ }

" auto reload
if exists("g:loaded_lightline") && g:colors_name =~# 'iceberg'
  execute "source " . g:plug_home . "/lightline.vim/autoload/lightline/colorscheme/iceberg.vim"
  windo call lightline#colorscheme()
elseif exists('g:colors_name')
  exe 'colorscheme ' . g:colors_name
endif

"---------------------------------------------------------------------------
" Plug 'tpope/vim-fugitive'
"---------------------------------------------------------------------------
set diffopt+=vertical
nnoremap <silent> gs :G<CR>
nnoremap <silent> gb :Git blame<CR>
nnoremap <silent> go :Git branch \| set filetype=gitbranch<CR>
nnoremap <silent> <leader>gr :Git branch --remote \| set filetype=gitbranch<CR>
nnoremap <silent> <leader>gc :Gclog! -n 50 \| copen<cr>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gz :Gclog! -g stash \| copen<CR>
nnoremap <silent> <leader>gt :0Gclog! \| copen<CR>
nnoremap <silent> <leader>gx :GBrowse<CR>
nnoremap <silent> <leader>gx :GBrowse<CR>
nnoremap <silent> <space>gg :Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<CR>

" vim diff
noremap <leader>dp :diffput<cr>
noremap <leader>do :diffget<cr>

"---------------------------------------------------------------------------
" Plug 'justinmk/vim-dirvish'
"---------------------------------------------------------------------------
let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'
let g:dirvish_relative_paths = 1

" #############################################
" Section: Functions
" #############################################

"---------------------------------------------------------------------------
" Miscellaneous.
"---------------------------------------------------------------------------
" REMOVE TRAILING WHITESPACE {{{
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" AUTO RELOAD {{{
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" }}}

" WIPE ALL REGISTERS {{{
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" }}}
