set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'
"Bundle 'AutoComplPop'
Bundle 'majutsushi/tagbar'
Bundle 'OmniCppComplete'
Bundle 'rosenfeld/conque-term'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'genutils'
Bundle 'sukima/xmledit'
"Bundle 'vimwiki'
Bundle 'pyflakes.vim'
Bundle 'indentpython.vim'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'Mark'
Bundle 'ShowMarks'
Bundle 'a.vim'
Bundle 'FencView.vim'
Bundle 'Solarized'
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

let mapleader = ";"    " 比较习惯用;作为命令前缀，右手小拇指直接能按到
" 把空格键映射成:
nmap <space> :

" 快捷打开编辑vimrc文件的键盘绑定
map <silent> <leader>e :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc

inoremap <leader>n <esc>

" 自动切换目录
autocmd BufEnter * silent! lcd %:p:h


" 判断是终端还是gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"======================================================
" 基本设置 
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
set nu              " 显示行号
set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set incsearch       " 增量式搜索
set nohlsearch
"set hlsearch        " 高亮搜索
set ignorecase      " 搜索时忽略大小写
set magic           " 额，自己:h magic吧，一行很难解释
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
set nowb
"set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
set lbr             " 在breakat字符处而不是最后一个字符处断行
set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
set wildmenu         
set nofen
set fdl=10
set scrolloff=5

" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" 不使用beep或flash 
set vb t_vb=


set history=400  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=n     " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等

"}}}
"====================================================== 

"在gvim中高亮当前行
if (g:isGUI)
    set cursorline
    hi cursorline guibg=#333333
    hi CursorColumn guibg=#333333
    set guifont=Monaco\ 10
    set guifontwide=Monaco\ 10
    set guioptions=-
endif

"======================================================  

" 设置字符集编码，默认使用utf8
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1

"======================================================

" 状态栏
set laststatus=2      " 总是显示状态栏
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

" 高亮光标所在列
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

" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
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
" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"======================================================


" 自定义按键
" {{{

" 用c-j,k在buffer之间切换
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

" Bash(Emacs)风格键盘绑定
imap <C-e> <END>
imap <C-a> <HOME>

"从系统剪切板中复制，剪切，粘贴
map <F2> "+y
map <F3> "+x
map <F4> "+p


" 快捷输入
" 自动完成括号和引号
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

" c-j自动补全，当补全菜单打开时，c-j,k上下选择
imap <expr> <c-j>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
imap <expr> <c-k>      pumvisible()?"\<C-P>":"\<esc>"
" f:文件名补全，l:行补全，d:字典补全，]:tag补全
imap <C-]>             <C-X><C-]>
imap <C-F>             <C-X><C-F>
imap <C-D>             <C-X><C-D>
imap <C-L>             <C-X><C-L> 
"}}}
"====================================================== 

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 删除buffer时不关闭窗口
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

" 插件设置
" {{{
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/qt4

" 插件窗口的宽度，如TagList,NERD_tree等，自己设置
let s:PlugWinSize = 25

" autocomplpop.vim 
"let g:acp_behaviorKeywordLength = 4
"====================================================== 

" neocomplcache settings
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
        \ }

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
inoremap <expr><silent> <CR> <SID>my_cr_function()
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
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
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" neosnippet settings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" ConqueTerm.vim
let g:ConqueTerm_FastMode = 0        " enable fast mode
let g:ConqueTerm_Color = 1           " diable terminal colors
let g:ConqueTerm_CloseOnEnd = 1      " close buffer when program exits
"======================================================  

" tagbar.vim
" <leader>tb 打开Tagbar窗口
nmap <silent> <leader>tb :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
"======================================================

" taglist.vim
" http://www.vim.org/scripts/script.php?script_id=273
" <leader>t 打开TagList窗口，窗口在右边
nmap <silent> <leader>t :TlistToggle<cr>
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 0
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_WinWidth = s:PlugWinSize
let Tlist_Auto_Open = 0
let Tlist_Display_Prototype = 0
"let Tlist_Close_On_Select = 1
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

" NERD_commenter.vim
" http://www.vim.org/scripts/script.php?script_id=1218
" 无需配置
"======================================================

" NERD tree
" http://www.vim.org/scripts/script.php?script_id=1658
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = s:PlugWinSize 
nmap <leader>f :NERDTreeToggle<cr>
"======================================================


" 更新ctags和cscope索引
" href: http://www.vimer.cn/2009/10/把vim打造成一个真正的ide2.html
" 稍作修改，提取出DeleteFile函数，修改ctags和cscope执行命令

map <F5> :call Do_CsTag()<cr>
function! Do_CsTag()
    let dir = getcwd()

    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
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
    " 刷新屏幕
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

" cscope 绑定
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


" Buffers Explorer （需要genutils.vim）
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

" Vimwiki配置
"let g:vimwiki_list = [{'path': '~/Dropbox/MyWiki/my_site/',
            "\ 'path-html': '~/Dropbox/MyWiki/my_site_html/',
            "\ 'html-header': '~/Dropbox/MyWiki/templates/header.tpl',
            "\ 'html-footer': '~/Dropbox/MyWiki/templates/footer.tpl'}]
"let g:vimwiki_camel_case=0

"let wiki = {}
"let wiki.path = '~/Dropbox/MyWiki/my_site/'
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"let g:vimwiki_list = [wiki]

let g:showmarks_enable = 0

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


" 文件类型

au BufNewFile,BufRead *.t2t set ft=txt2tags

"au FileType python set ft=python.django
"au FileType html set ft=htmldjango.html

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete

"======================================================
