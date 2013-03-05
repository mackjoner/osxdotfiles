set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'bufexplorer.zip'
"Bundle 'taglist.vim'
"Bundle 'AutoComplPop'
Bundle 'majutsushi/tagbar'
Bundle 'OmniCppComplete'
"Bundle 'rosenfeld/conque-term'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'genutils'
Bundle 'sukima/xmledit'
"Bundle 'vimwiki'
Bundle 'pyflakes.vim'
Bundle 'indentpython.vim'
Bundle 'surround.vim'
Bundle 'matchit.zip'
"Bundle 'Mark'
"Bundle 'ShowMarks'
Bundle 'a.vim'
Bundle 'FencView.vim'
"Bundle 'Solarized'
"Bundle 'liuerfire/my_snipMate.git'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'FuzzyFinder'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'liuerfire/snipmate-snippets'
Bundle 'fcitx.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

let mapleader = ";"
nmap <space> :

map <silent> <leader>e :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc

inoremap <leader>n <esc>

" change directory automatically
autocmd BufEnter * silent! lcd %:p:h


if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"======================================================
" {{{
"set list
"set listchars=tab:>-,trail:-
set background=dark
set t_Co=256
colorscheme molokai
set display=lastline
syntax enable
"filetype plugin on
"filetype indent on
set shortmess=I   " do not give the intro message when staring vim
autocmd BufEnter * :syntax sync fromstart
set nu
set showcmd
set lz
set hid
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l
set incsearch
set nohlsearch
"set hlsearch
set ignorecase
set magic
set showmatch
set nobackup
set nowb
set noswapfile
set lbr
set ai
set si
set cindent
set wildmenu         
set nofen
set fdl=10
set scrolloff=5

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

autocmd FileType ruby setlocal et sta sw=2

set vb t_vb=


set history=400
set autoread
set mouse=n

"}}}
"====================================================== 
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333


if (g:isGUI)
    set guifont=Source\ Code\ Pro\ 10
    set guifontwide=Source\ Code\ Pro\ 10
    set guioptions=-
endif

"======================================================  

"encoding 
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,cp936

"======================================================

set laststatus=2
"highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
"function! CurDir()
    "let curdir = substitute(getcwd(), $HOME, "~", "g")
    "return curdir
"endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\  

"set statusline=[%n]\ %t%m%r%h%y\ \|\ %{CurDir()}\ \|%=%{&ff}\ \|\ 
"set statusline+=%{&fenc!=''?&fenc:&enc}\ \|\ 
"set statusline+=%l,%c\ %p%%\ \|\ 

"====================================================== 

au BufNewFile,BufRead *.t2t set ft=txt2tags

"au FileType python set ft=python.django
"au FileType html set ft=htmldjango.html

" Enable omni completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete

" highlight current column
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
map ;ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"======================================================


" {{{

nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

imap <C-e> <END>
imap <C-a> <HOME>

map <F2> "+y
map <F3> "+x
map <F4> "+p


inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

imap <expr> <c-j>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
imap <expr> <c-k>      pumvisible()?"\<C-P>":"\<esc>"
imap <C-]>             <C-X><C-]>
imap <C-F>             <C-X><C-F>
imap <C-D>             <C-X><C-D>
imap <C-L>             <C-X><C-L> 
"}}}
"====================================================== 

set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"======================================================

" {{{
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/qt4

let s:PlugWinSize = 25

" autocomplpop.vim 
"let g:acp_behaviorKeywordLength = 4
"====================================================== 

" neocomplcache settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" neosnippet settings
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" tagbar.vim
nmap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
"======================================================


" OmniCppComplete.vim
" http://www.vim.org/scripts/script.php?script_id=1520
set completeopt=menu
let OmniCpp_NamespaceSearch = 1
let Omnicpp_GlobalScopeSearch = 1
let Omnicpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]     " 逗号分割的字符串
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_SelectFirstItem = 2 
"======================================================

" NERD tree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = s:PlugWinSize 
nmap <leader>f :NERDTreeToggle<cr>
"======================================================


map <F5> :call Do_CsTag()<cr>
function! Do_CsTag()
    let dir = getcwd()

    if ( DeleteFile(dir, "tags") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.files") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.out") ) 
        return 
    endif

    if(executable('ctags'))
        silent! execute "!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    execute "redr!"
endfunction

function! DeleteFile(dir, filename)
    if filereadable(a:filename)
        let ret = delete("./".a:filename)
        if (ret != 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction

if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    " s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif


" Buffers Explorer （need genutils.vim）
" http://vim.sourceforge.net/scripts/script.php?script_id=42
" http://www.vim.org/scripts/script.php?script_id=197
let g:bufExplorerDefaultHelp=0       " Do not show default help.
" let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = s:PlugWinSize  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
nmap <silent> <Leader>b :BufExplorer<CR>
"======================================================

" xmledit settings
let xml_use_xhtml = 1
"====================================================== 

" Vimwiki
"let g:vimwiki_list = [{'path': '~/Dropbox/MyWiki/my_site/',
            "\ 'path-html': '~/Dropbox/MyWiki/my_site_html/',
            "\ 'html-header': '~/Dropbox/MyWiki/templates/header.tpl',
            "\ 'html-footer': '~/Dropbox/MyWiki/templates/footer.tpl'}]
"let g:vimwiki_camel_case=0

"let wiki = {}
"let wiki.path = '~/Dropbox/MyWiki/my_site/'
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"let g:vimwiki_list = [wiki]

" indent guidess settings
let g:indent_guides_guide_size = 1

" powerline settings
let g:Powerline_symbols = 'unicode'
"let g:Powerline_stl_path_style = 'short'

" vim-javascript settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" pyflakes settings
let g:pyflakes_use_quickfix = 0

"}}}
"======================================================
