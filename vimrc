if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --racer-completer --gocode-completer' }
Plug 'edkolev/tmuxline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'luochen1990/rainbow'
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'neomake/neomake'
Plug 'fatih/vim-go', { 'for': 'go' }
call plug#end()

let mapleader = ";"
nmap <space> :

if !has('nvim')
    nmap <leader>e :e ~/.vimrc<cr>
else
    nmap <leader>e :e ~/.config/nvim/init.vim<cr>
endif

if (has("termguicolors"))
   set termguicolors
endif

colorscheme gruvbox
"======================================================
" {{{
set background=dark
set nu
set showcmd
set lz
set hid
set whichwrap+=<,>,h,l
set ignorecase
set magic
set showmatch
set nobackup
set noswapfile
set lbr
set cindent
set nohlsearch

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set mouse=n

set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set cursorline
"set cursorcolumn

"}}}


"======================================================

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.j2 set ft=htmldjango

autocmd FileType ruby,eruby,scheme,racket,javascript,sql setlocal et sta sw=2
autocmd FileType html,htmldjango,xhtml,css,scss,xml,yaml setlocal et sta sw=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

set viminfo='100,:100,<100,s100
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

map <leader>cta <esc>:!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q<CR>

"======================================================

" fzf-vim
nnoremap <C-p> :FZF<CR>
nnoremap <leader>ag :Ag <C-R><C-W><CR>

" tagbar.vim
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 25

"vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Neomake
autocmd! BufWritePost * Neomake

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"

" javascript-libraries-syntax.vim settings
let g:used_javascript_libs = 'angularjs,angularui,jquery,react'

" YouCompleteMe settings
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_rust_src_path = '/Users/liuerfire/OpenSource/rust/src'
let g:ycm_global_ycm_extra_conf = '/Users/liuerfire/.config/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1

" Rainbow settings
let g:rainbow_active = 1

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
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

" The variable _s is used to save and restore the last search pattern
" register (so next time the user presses n they will continue their last search),
" and :nohl is used to switch off search highlighting (so trailing spaces will not
" be highlighted while the user types). The e flag is used in the substitute
" command so no error is shown if trailing whitespace is not found. Unlike before,
" the substitution text must be specified in order to use the required flag.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent><leader>sw  :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"}}}
"=====================================================
