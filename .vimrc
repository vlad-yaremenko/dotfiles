execute pathogen#infect()

set nowrap " Disable text wrap
syntax on " Enable syntax processing
filetype plugin indent on " Load filetype specific indent files
set tabstop=2 " Show existing tab with 2 spaces width
set shiftwidth=2 " When indenting with '>', use 2 spaces width
set softtabstop=2 " When indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces

" set theme
set background=dark
let g:solarized_termtrans=1
colorscheme happy_hacking " Set color scheme

set backupskip=/tmp/*,/private/tmp/* " Don’t create backups when editing files in certain directories

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t add empty newlines at the end of files
set binary
set noeol

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set gdefault " Add the g flag to search/replace by default
set ttyfast " Optimize for fast terminal connections
set esckeys " Allow cursor keys in insert mode
set wildmenu " Enhance command-line completion
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set nocompatible " Make Vim more useful
set number " Show line numbers
set showcmd " Show command in bottom bar
set cursorline " Highlight current line
set wildmenu " Visual autocomplete for command menu
set lazyredraw " Redraw only when we need to
set showmatch " Highlight matching [{()}]
set incsearch " Search as characters are entered
set hlsearch " Highlight matches
set autoread " Monitor realtime changes
set ignorecase " Ignore case of searches

" Show the cursor position
set ruler

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Show the current mode
set showmode

" Don’t show the intro message when starting Vim
set shortmess=atI

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Turn off search highlight \ > <space>
nnoremap <leader><space> :nohlsearch<CR>

set foldenable " Enable folding
set foldlevelstart=10 " Open most folds by default
set foldnestmax=10 " 10 nested fold max

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

set foldmethod=indent " Fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

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

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let NERDTreeShowHidden=1

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set updatetime=250

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Strip trailing whitespace (<leader>ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
