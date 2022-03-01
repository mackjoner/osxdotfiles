if empty(glob('~/.vim/autoload/plug.vim', '~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'romainl/Apprentice'

" Edit
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'luochen1990/rainbow'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'

" Shorthand notation;
Plug 'junegunn/vim-easy-align'

" Tool
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/pboettch/vim-cmake-syntax.git', { 'for': 'cmake' }

" Autocomplete
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --racer-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Lint
Plug 'w0rp/ale'

" Language
"Plug 'sheerun/vim-polyglot', { 'for': 'AllInOne' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'Yggdroot/indentLine', { 'for': 'python' }
Plug 'https://github.com/vim-python/python-syntax.git', { 'for': 'python' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/c.vim', { 'for': 'c' }
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git', { 'for': 'cpp11/14/17' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'https://github.com/neovimhaskell/haskell-vim.git', { 'for': 'haskell' }

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

set fileencodings=ucs-bom,utf-8,gb18030,gb2312,gbk,cp936
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
set backspace=2

set mouse=n

set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set cursorline
"set cursorcolumn

set completeopt=menuone,noinsert,noselect,preview
set pyxversion=3

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

"colorscheme gruvbox
colorscheme PaperColor

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.j2 set ft=htmldjango
autocmd FileType ruby,eruby,scheme,racket,javascript,sql setlocal et sta sw=2
autocmd FileType html,htmldjango,xhtml,css,scss,xml,yaml,toml setlocal et sta sw=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

set viminfo='100,:100,<100,s100
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

map <F2> "+y
map <F3> "+x
map <F4> "+p

nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quickfix and loclist
nnoremap [q :cprevious<cr>zz
nnoremap ]q :cnext<cr>zz
nnoremap [l :lprevious<cr>zz
nnoremap ]l :lnext<cr>zz

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

imap <C-e> <ESC>A
imap <C-a> <ESC>I

" The variable _s is used to save and restore the last search pattern
" register (so next time the user presses n they will continue their last search),
" and :nohl is used to switch off search highlighting (so trailing spaces will not
" be highlighted while the user types). The e flag is used in the substitute
" command so no error is shown if trailing whitespace is not found. Unlike before,
" the substitution text must be specified in order to use the required flag.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent><leader>sw  :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

map <leader>cta <esc>:!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q<CR>

" ale
nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)

let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = '--vendor --fast --disable=gocyclo'

" fzf-vim
nnoremap <C-p> :FZF<CR>
nnoremap <leader>ag :Ag <C-R><C-W><CR>
nnoremap <leader><Enter> :Buffers<CR>

" keymap
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" clean search highlight
noremap <silent><leader>/ :nohlsearch<CR>

" tagbar.vim
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 25

" NERDTree
nnoremap <silent> <leader>d :NERDTreeToggle<CR>

"vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'aurora'

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"

" javascript-libraries-syntax.vim settings
let g:used_javascript_libs = 'angularjs,angularui,jquery,react'

" YouCompleteMe settings
"nnoremap <leader>jd :YcmCompleter GoTo<CR>
"let g:ycm_rust_src_path = $HOME.'/OpenSource/rust/src'
"let g:ycm_global_ycm_extra_conf = $HOME.'/.config/ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_insertion = 1

" Rainbow settings
let g:rainbow_active = 1

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" which works in most cases, but can be a little slow on large files.
"let g:cpp_experimental_simple_template_highlight = 1
" which is a faster implementation but has some corner cases where it doesn't work.
"let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1

"let python_highlight_all = 1
let g:python_highlight_all = 1
let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3"

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

let g:lua_syntax_someoption = 1
let g:scala_scaladoc_indent = 1

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
