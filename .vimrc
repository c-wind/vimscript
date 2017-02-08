" 在处理未保存或只读文件的时候，弹出确认 set confirm " 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

let mapleader = ","

colo desert

"Taglist插件的设置
let g:Tlist_Use_Right_Window=0
let g:Tlist_Show_One_File=1
let g:Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:pydiction_location='~/.vim/ftdetect/complete-dict'
let g:pydiction_menu_height = 3

let Tlist_WinWidth=40


"光标在窗口上下边界时距离边界7行即开始滚屏
set so=7

"配色
" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "对于html，xml文件，通过ctrl+_来closetag
    if has("autocmd")
        autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
        autocmd FileType go,c vmap <C-o> <ESC>'<i/*<CR><ESC>o<ESC>'>o*/
        autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
    endif " has("autocmd")
endif " exists(...)

"显示行号
set number

"语法高亮度显示
syntax on

"检测文件的类型 开启codesnip
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
set completeopt=longest,menu
set runtimepath+=~/.vim/textmateOnly
set runtimepath+=~/.vim/after
let g:SuperTabDefaultCompletionType="<C-X><C-O>"



"缩进相关
" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent
setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4

noremap <C-=> <Esc>10<C-w>+
noremap <C--> <Esc>10<C-w>-


function! RemoveTrailingSpace()
    if $VIM_HATE_SPACE_ERRORS != '0' &&
                \(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'vim')
        normal m`
        silent! :%s/\s\+$//e
        normal ``
    endif
endfunction
" Remove trailing spaces for C/C++ and Vim files
au BufWritePre *                  call RemoveTrailingSpace()

"if &term=="xterm"
"  set t_Co=8
"  set t_Sb=^[[4%dm
"  set t_Sf=^[[3%dm
"endif
"set shiftwidth=2
set tabstop=4
set softtabstop=4
set expandtab
" ambiwidth 默认值为 single。在其值为 single 时，
" 若 encoding 为 utf-8，gvim 显示全角符号时就会
" 出问题，会当作半角显示。
set ambiwidth=double
set autoread                " 自动重新加载外部修改内容
set autochdir               " 自动切换当前目录为当前文件所在的目录

"No bell settings {{{
set noerrorbells
set visualbell
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif
"No bell settings End }}}

"在编辑过程中，在右下角显示光标位置的状态行
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

set nolinebreak             " 在单词中间断行
" 在状态栏显示目前所执行的指令，未完成的指令片段亦
" 会显示出来
set showcmd
set wrap                    " 自动换行显示
"CmdLine settings {{{
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [Lines=%L]
"
" 高亮字符，让其不受100列限制
highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
"match OverLength '\%101v.*'

"显示匹配括号
set showmatch

"默认无备份
set nobackup
set nowritebackup

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocp
" 增强模式中的命令行自动完成操作
set wildmenu

"文字编码加入utf8
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set enc=utf-8
let &termencoding=&encoding

" 使用英文菜单,工具条及消息提示
set langmenu=none

"自动缩排
set ai

"搜索不分大小写
set ic

"标识关键字
set hls

" 不要闪烁
set novisualbell

"设置语法折叠
"set foldmethod=syntax
"set foldcolumn=3 "设置折叠区域的宽度
"set foldclose=all "设置为自动关闭折叠

nnoremap <space> /

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :call QuitWithoutSave()<cr>
nnoremap <leader>x :call QuitWithSave()<cr>
nnoremap <leader>t :TagbarToggle<cr>

nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>


set incsearch


"打开自己工程的时候自动加载的脚本
if getfsize(".vimscript")>0
    source .vimscript
endif

"valgrind 相关
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'


"runtime ftplugin/man.vim
let Vimplate = "$HOME/bin/vimplate"
fun! ReadMan()
    " Assign current word under cursor to a script variable:
    let s:man_word = expand('<cword>')

    " Open a new window:
    :exe ":wincmd n"

    " Read in the manpage for man_word (col -b is for formatting):
    :exe ":r!man " . s:man_word . " | col -b"

    " Goto first line...
    :exe ":goto"

    " and delete it:
    :exe ":delete"
endfun



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"加上日期 对应F2
:map <F2> gg:read !date<CR>

" bind :CD to :cd %:h, then change cwd to the dir that includes current file
sil! com -nargs=0 CD exe 'cd %:h'

" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符

" C的编译和运行
map <F5> :call CompileRun()<CR>

func! CompileRun()
    let ftype = expand("%:e")
    if ftype ==? "c"
        call CompileRunGcc()
    elseif ftype ==? "cc" || ftype ==? "cpp"
        call CompileRunGxx()
    elseif ftype ==? "go"
        call CompileRunGolang()
    endif
endfunc

func! CompileRunGolang()
    exec "w"
    exec "!go run %"
endfunc

func! CompileRunGxx()
    exec "w"
    exec "!g++ -Wall -g % -o %<"
    exec "! ./%<"
endfunc

func! CompileRunGcc()
    exec "w"
    exec "!gcc -Wall -g % -o %<"
    exec "! ./%<"
endfunc


" 能够漂亮地显示.NFO文件
"set encoding=utf-8
"function! SetFileEncodings(encodings)
"  let b:myfileencodingsbak=&fileencodings
"  let &fileencodings=a:encodings
"endfunction
function! RestoreFileEncodings()
    if line("'\"")>0&&line("'\"")<=line("$") |
        exe "normal g'\"" |
    endif
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
"指向上次编辑位置
au BufReadPost * call RestoreFileEncodings()

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

" Map the M key to the ReadMan function:
map M :call ReadMan()<CR>

"csupport
let g:alternateNoDefaultAlternate = 1


" 双反斜杠\\即可打开bufexplorer
map <leader><leader> \be
" Ctrl+Enter也可以切换buffer
map C-Enter C-Tab
nnoremap <silent> <F4> :tabprevious<CR>

:set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap <silent> <F3> :Grep<CR>
"自动补全
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>

inoremap . .<C-X><C-O>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf



"选中一段文字并全文搜索这段文字
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示

:runtime! ftplugin/man.vim
set keywordprg=dicty

set fileencodings=utf-8,gb18030,utf-16,big5

let OmniCpp_MayCompleteDot=1        "打开.操作符
let OmniCpp_MayCompleteArrow=1      "打开->操作符
let OmniCpp_MayCompleteScope=1      "打开::操作符
let OmniCpp_NamespaceSearch=1       "打开命名空间
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1   "打开显示函数原型
let OmniCpp_SelectFirstItem = 0     "自动弹出时自动跳至第一个

" Line highlight 設此標整行會標註顏色
" 高亮当前行
set cursorline
" Column highlight 設此是遊標整列會標註顏色
"set cursorcolumn
highlight cursorline cterm=bold ctermbg=2

highlight Pmenu ctermbg=2 ctermfg=1 cterm=none
highlight PmenuSel ctermbg=3  ctermfg=7 cterm=bold
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb ctermbg=7

let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_expand = 1

func! QuitWithSave()
    let ftype = expand("%:e")
    if ftype ==? "go"
        w!
        let fileName = expand("%:p")
        let cmd = "go fmt ".fileName
        let res = system(cmd)
        if len(res) && stridx(res, ":") != -1
            echo res
            return
        endif
        e!
    endif
    x
endfunc


func! QuitWithoutSave()
    q!
endfunc


