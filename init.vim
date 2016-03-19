" Instantiate plugin manager
set runtimepath+=~/.config/nvim/repos/Shougo/dein.vim/
call dein#begin(expand('~/.cache/nvim/repos'))
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
if dein#check_install()
    call dein#install()
endif
call dein#end()

" Attempt to determine the type of file based on its name
filetype plugin indent on
syntax on

set shell=bash        " Use the right shell
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""
" Whitespace and newlines
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ffs=unix,dos,mac " Unix file format

""""""""""""""""""""""""""""""""""""""""
" Rendering and display
colorscheme desert
set background=dark
set lazyredraw
set showmatch " Show matching [({})]
set ruler             " Show on-screen position
set title             " Update the terminal title
set scrolloff=3       " More context around scrolling
set sidescrolloff=5   " More context around scrolling horizontally
set updatetime=250    " Update time 250ms

" Make \s turn on/off trailing whitespace
set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:_,eol:$
nmap <silent> <leader>s :set nolist!<CR>

""""""""""""""""""""""""""""""""""""""""
" Search

" highlight last inserted
noremap gV `[v`]

" Toggle search highlighting
noremap <F3> :set hlsearch!<CR>

""""""""""""""""""""""""""""""""""""""""
" Menus and feedback
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc
set errorbells " No sound on errors
set visualbell " No sound on errors
set showcmd    " Show (partial) command in status line

""""""""""""""""""""""""""""""""""""""""
" Editing
set backspace=indent,eol,start " Backspace into previous line
set whichwrap+=<,>,h,l
set history=1000
set pastetoggle=<F4> " Toggle paste mode for insert
nore ; : " Keyboard mapping

" Buffers moving between buffers
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
map <Leader>a :A<CR>
map <Leader>l :b#<CR>
map <Leader>k :Bclose<CR>
map <Leader>K :Bclose!<CR>
set hidden " Allow moving between buffers with file changes

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""
" Plugins

" Undo tree
nnoremap <leader>u :GundoToggle<CR>

" Directory browsing
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>r :NERDTreeFind<CR>

" CtrlP
"     <c-p>        -- Launch CtrlP
"     <c-f>, <c-b> -- cycle between modes
"     <c-d>        -- filename only vs full path
"     <c-r>        -- regexp
"     <c-j>, <c-k> -- navigate result list
"     <c-n>, <c-p> -- select next/prev string in history
set wildignore+=/tmp/*,*.so,*.sw[pomn],*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" GitGutter settings default keybindings:
"     nmap ]c " next hunk
"     nmap [c " previous hunk

