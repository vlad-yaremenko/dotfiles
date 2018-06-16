execute pathogen#infect()

" Disable text wrap
set nowrap
" Enable syntax processing
syntax on
" Load filetype specific indent files
filetype plugin indent on
" 2 spaces instead tab
set tabstop=2 shiftwidth=2 expandtab
" set theme
set background=dark
let g:solarized_termtrans=1
" Set color scheme
colorscheme deus
" Allow transparent background
hi Normal guibg=NONE ctermbg=NONE
" Add the g flag to search/replace by default
set gdefault
" Optimize for fast terminal connections
set ttyfast
" Enhance command-line completion
set wildmenu
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Make Vim more useful
set nocompatible
" Show line numbers
set number
" Show command in bottom bar
set showcmd
" Enable CTags
set tags=tags
" Highlight current line
set cursorline
" Visual autocomplete for command menu
set wildmenu
" Redraw only when we need to
set lazyredraw
" Highlight matching [{()}]
set showmatch
" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Monitor realtime changes
set autoread
" Ignore case of searches
set ignorecase
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Disable error bells
set noerrorbells
" Turn off search highlight \ > <space>
nnoremap <leader><space> :nohlsearch<CR>
" Enable folding
set foldenable
" Open most folds by default
set foldlevelstart=10
" 10 nested fold max
set foldnestmax=10
" Map Ctrl + / for toggle comment
if has('win32')
  nmap <C-/> <leader>c<Space>
  vmap <C-/> <leader>c<Space>
else
  nmap <C-_> <leader>c<Space>
  vmap <C-_> <leader>c<Space>
endif
" Space open/closes folds z > a
nnoremap <space> za
" Fold based on indent level
set foldmethod=indent
" highlight last inserted text
nnoremap gV `[v`]
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1
endif
" Save session \ > s
" Reopen vim with vim -S
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ack
" ctrl + p file search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" NERD Tree settings
map <F3> :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" NERDTree settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let NERDTreeShowHidden=1

" NERDTree git plugin
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set updatetime=250

" Trim white spaces with F2
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
set list lcs=trail:›

" vim-javascript plugin
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Spell check to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

" Tagbar shortcat
nmap <F8> :TagbarToggle<CR>
