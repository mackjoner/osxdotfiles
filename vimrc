set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'tpope/vim-surround'
Bundle 'matchit.zip'
Bundle 'a.vim'
Bundle 'mbbill/fencview'
Bundle 'Yggdroot/indentLine'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler.vim'
"Bundle 'chrisbra/NrrwRgn'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'kovisoft/slimv'
Bundle 'wlangstroth/vim-racket'
Bundle 'fatih/vim-go'
Bundle 'rust-lang/rust.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'edkolev/tmuxline.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'


filetype plugin indent on

let mapleader = ";"
nmap <space> :

map <silent> <leader>e :e $HOME/.vimrc<cr>

inoremap <leader>n <esc>

"======================================================
" {{{
set background=dark
set t_Co=256
set display=lastline
syntax enable
set shortmess=I   " do not give the intro message when staring vim
set nu
set showcmd
set lz
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch
set nohlsearch
set ignorecase
set magic
set showmatch
set nobackup
set noswapfile
set lbr
set ai
set si
set cindent
set wildmenu
set scrolloff=5

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set vb t_vb=

set autoread
set mouse=n

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
"}}}
"======================================================
set cursorline
set cursorcolumn

colorscheme solarized

if has("gui_running")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set guifontwide=Source\ Code\ Pro\ for\ Powerline:h14
    set guioptions=-
    colorscheme base16-atelierdune
endif

"======================================================

"encoding
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,cp936

"======================================================

set laststatus=2

"======================================================

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.j2 set ft=htmldjango

autocmd FileType ruby,eruby,scheme,racket,javascript,sql setlocal et sta sw=2
autocmd FileType html,htmldjango,xhtml,css,xml setlocal et sta sw=2

" Enable omni completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

set viminfo='100,:100,<100,s100
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"======================================================


" tagbar.vim
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 25
"======================================================

map <leader>cta <esc>:!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q<CR>

"======================================================

"slimv settings
let g:slimv_impl = 'mit'

"vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':h'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ubaryd'

" syntastic settings
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" vimfiler settings
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '\%('
            \ .'^\..*\|'
            \ .'\.pyc$\|'
            \ .'^__pycache__$\|'
            \ .'\.egg-info$\)'

" Unite.vim settings
nnoremap <C-p> :<C-u>Unite -start-insert file_rec<cr>

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
"======================================================

" {{{

nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

imap <C-e> <END>
imap <C-a> <ESC>I

map <F2> "+y
map <F3> "+x
map <F4> "+p

inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>5 (<esc>o)<esc>:let leavechar=")"<cr>O
inoremap <leader>6 [<esc>o]<esc>:let leavechar="]"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

"}}}
"=====================================================
