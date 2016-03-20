""""""""""""""""""""""""""""""""""""""""
" Instantiate plugin manager
"
set runtimepath+=~/.config/nvim/repos/Shougo/dein.vim/
call dein#begin(expand('~/.cache/nvim/repos'))
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('vim-airline/vim-airline')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('derekwyatt/vim-fswitch')
call dein#add('tpope/vim-surround')
call dein#add('fholgado/minibufexpl.vim')
call dein#add('moll/vim-bbye')
"call dein#add('jeetsukumaran/vim-buffergator')
if dein#check_install()
    call dein#install()
endif
call dein#local('~/.config/nvim/bundle')
call dein#end()

" Attempt to determine the type of file based on its name
filetype plugin indent on
syntax on

set shell=bash        " Use the right shell
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>ey :e ~/.config/nvim/ycm_extra_conf.py<CR>

let g:python_host_skip_check = 1

""""""""""""""""""""""""""""""""""""""""
" Whitespace and newlines
set expandtab
set smarttab
set softtabstop=4
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
" Folding
set foldenable

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
map <Leader>k :Bdelete<CR>
map <Leader>K :Bdelete!<CR>
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
"  nnoremap <leader>u :GundoToggle<CR>

" Directory browsing
let NERDTreeIgnore = ['\.pyc$']
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

" Commenter defaults:
"     noremap <silent> <leader>cc :NERDComComment
"     noremap <silent> <leader>cn :NERDComNestedComment
"     noremap <silent> <leader>c<space> :NERDComToggleComment
"     noremap <silent> <leader>cm :NERDComMinimalComment
"     noremap <silent> <leader>ci :NERDComInvertComment
"     noremap <silent> <leader>cs :NERDComSexyComment
"     noremap <silent> <leader>cy :NERDComYankComment
"     noremap <silent> <leader>cy :NERDComYankComment
"     noremap <silent> <leader>c$ :NERDComEOLComment
"     noremap <silent> <leader>cA :NERDComAppendComment
"     noremap <silent> <leader>cu :NERDComUncommentLine

" FSSwitch - alternate between current files
noremap <leader>a :FSHere<CR>

" MiniBufExpl
noremap <leader>bo :MBEOpen<CR>
noremap <leader>bt :MBEToggle<CR>
noremap <leader>bf :MBEFocus<CR>
noremap <leader>bm :MBEToggleMRU<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
noremap <leader>jt :YcmCompleter GoTo<CR>
noremap <leader>jd :YcmCompleter GoToDefinition<CR>
noremap <leader>jc :YcmCompleter GoToDeclaration<CR>
noremap <leader>ji :YcmCompleter GoToInclude<CR>
noremap <leader>gt :YcmCompleter GetType<CR>
noremap <leader>gp :YcmCompleter GetParent<CR>
noremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
