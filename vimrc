if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'tpope/vim-surround'
NeoBundle 'matchit.zip'
NeoBundle 'a.vim'
NeoBundle 'mbbill/fencview'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\    },
\ }
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kovisoft/slimv'
NeoBundle 'wlangstroth/vim-racket'
NeoBundle 'fatih/vim-go'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'hdima/python-syntax'
NeoBundle 'luochen1990/rainbow'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


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
set synmaxcol=128

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set vb t_vb=

set autoread
set mouse=n

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set cursorline
set cursorcolumn
"}}}
"======================================================

colorscheme PaperColor

if has("gui_running")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set guifontwide=Source\ Code\ Pro\ for\ Powerline:h14
    set guioptions=-
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
autocmd FileType html,htmldjango,xhtml,css,xml,yaml setlocal et sta sw=2

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
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ubaryd'

" syntastic settings
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_html_checkers = ['']

" vimfiler settings
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '\%('
            \ .'^\..*\|'
            \ .'\.pyc$\|'
            \ .'^__pycache__$\|'
            \ .'\.egg-info$\)'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" Unite.vim settings
nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>ub :<C-u>Unite buffer<CR>
nnoremap <leader>ug :<C-u>Unite grep<CR>
if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nogroup', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"

" javascript-libraries-syntax.vim settings
let g:used_javascript_libs = 'angularjs,angularui,jquery,react'

" YouCompleteMe settings
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" python-syntax settings
let python_highlight_all = 1

" Rainbow settings
let g:rainbow_active = 1
"======================================================

" {{{

nn <C-J> :bp<cr>
nn <C-K> :bn<cr>

imap <C-e> <END>
imap <C-a> <ESC>I

map <F2> "+y
map <F3> "+x
map <F4> "+p

nnoremap j gj
nnoremap k gk

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
