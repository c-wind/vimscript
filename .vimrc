" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ�� set confirm " �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-

let mapleader = ","

"Tlist �� wm������
"����ģʽ����wm��Tlist��WM
set showcmd

"Taglist���������
let g:Tlist_Use_Right_Window=0
"let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File=1
let g:Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='TagList'
"let g:Tlist_Process_File_Always=1
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:pydiction_location='~/.vim/ftdetect/complete-dict'
let g:pydiction_menu_height = 3

let Tlist_WinWidth=40

"Tree explorer������
"let g:treeExplVertical=1
"let g:treeExplWinSize=30


"����ڴ������±߽�ʱ����߽�7�м���ʼ����
set so=7

"��ɫ
" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")

    " color scheme
    if has("gui_running")
        set guioptions-=T "���ع�����
        set guioptions-=m
        set guioptions-=L
        set guioptions-=r
        color blackboard
        "colorscheme professional
        "set guifont=YaHeiConsolasHybrid\ 13
        set guifont=Monaco\ 13
        "��������
        set guifontset=Microsoft\ YaHei\ 13
        "����html��xml�ļ���ͨ��ctrl+_��closetag
        if has("autocmd")
            autocmd FileType text,xml,html,perl,shell,bash,vim,php,ruby color blackboard
            autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
            autocmd FileType java,c,cpp,cs color desertEx
            autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl setlocal textwidth=100
            autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
        endif " has("autocmd")
    else
        color desert
        "colorscheme zellner
        "����html��xml�ļ���ͨ��ctrl+_��closetag
        if has("autocmd")
            autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
            autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl setlocal textwidth=100
            autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
        endif " has("autocmd")
    endif " has
endif " exists(...)
"����������ն˵�
set background=dark

"��ʾ�к�
set number

"�﷨��������ʾ
syntax on

"����ļ������� ����codesnip
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
set completeopt=longest,menu
set runtimepath+=~/.vim/textmateOnly
set runtimepath+=~/.vim/after
"so ~/.vim/plugin/supertab.vim
let g:SuperTabDefaultCompletionType="<C-X><C-O>"


"���֧��
"if has('mouse')
"  set mouse=a
"endif

"�������
" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
set autoindent

" ΪC�����ṩ�Զ�����
set smartindent

" ʹ��C��ʽ������
set cindent
setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4

"au FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4
"au FileType go setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4
"au FileType diff  setlocal shiftwidth=4 tabstop=4
"au FileType html  setlocal autoindent indentexpr=
"au FileType changelog setlocal textwidth=76

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
" ambiwidth Ĭ��ֵΪ single������ֵΪ single ʱ��
" �� encoding Ϊ utf-8��gvim ��ʾȫ�Ƿ���ʱ�ͻ�
" �����⣬�ᵱ�������ʾ��
set ambiwidth=double
set autoread                " �Զ����¼����ⲿ�޸�����
set autochdir               " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼

"No bell settings {{{
set noerrorbells
set visualbell
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif
"No bell settings End }}}

"�ڱ༭�����У������½���ʾ���λ�õ�״̬��
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ
set shortmess=atI

set nolinebreak             " �ڵ����м����
" ��״̬����ʾĿǰ��ִ�е�ָ�δ��ɵ�ָ��Ƭ����
" ����ʾ����
set showcmd
set wrap                    " �Զ�������ʾ
"CmdLine settings {{{
set cmdheight=1             " �趨�����е�����Ϊ 1
set laststatus=2            " ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [Lines=%L]
"
" �����ַ������䲻��100������
highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
"match OverLength '\%101v.*'

"��ʾƥ������
set showmatch

"Ĭ���ޱ���
set nobackup
set nowritebackup

"��insertģʽ������ɾ��������ɾ��
set backspace=indent,eol,start

"ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;���
set nocp
" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu

"���ֱ������utf8
" �趨Ĭ�Ͻ���
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set enc=utf-8
let &termencoding=&encoding

" ʹ��Ӣ�Ĳ˵�,����������Ϣ��ʾ
set langmenu=none

"�Զ�����
set ai

"�������ִ�Сд
set ic

"��ʶ�ؼ���
set hls

" ��Ҫ��˸
set novisualbell

"�����﷨�۵�
"set foldmethod=syntax
"set foldcolumn=3 "�����۵�����Ŀ��
"set foldclose=all "����Ϊ�Զ��ر��۵�

nnoremap <space> /

"nnoremap <leader>x :xa!<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :call QuitWithoutSave()<cr>
nnoremap <leader>x :call QuitWithSave()<cr>
nnoremap <leader>t :TagbarToggle<cr>
"nnoremap <leader>t :Tlist<cr>

nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>


set incsearch


"���Լ����̵�ʱ���Զ����صĽű�
if getfsize(".vimscript")>0
    source .vimscript
endif

"valgrind ���
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'

"�ֵ����
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

"cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set nocst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
nmap ,,s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,,g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,,c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,,t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ,,e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ,,f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,,i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ,,d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
            \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
            \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
            \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
            \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
            \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
            \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
            \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
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
"�������� ��ӦF2
:map <F2> gg:read !date<CR>

" bind :CD to :cd %:h, then change cwd to the dir that includes current file
sil! com -nargs=0 CD exe 'cd %:h'

" F5���������C����F6���������C++����
" ��ע�⣬����������windows��ʹ�ûᱨ��
" ��Ҫȥ��./�������ַ�

" C�ı��������
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


" �ܹ�Ư������ʾ.NFO�ļ�
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
"ָ���ϴα༭λ��
au BufReadPost * call RestoreFileEncodings()

" ������ʾ��ͨtxt�ļ�����Ҫtxt.vim�ű���
au BufRead,BufNewFile *  setfiletype txt

" Map the M key to the ReadMan function:
map M :call ReadMan()<CR>

"csupport
let g:alternateNoDefaultAlternate = 1

"a.vim
nnoremap <silent> <F12> :A<CR>

"nmap wm :WMToggle<cr>
"nmap wm :Tlist<cr>

" ˫��б��\\���ɴ�bufexplorer
map <leader><leader> \be
" Ctrl+EnterҲ�����л�buffer
map C-Enter C-Tab
nnoremap <silent> <F4> :tabprevious<CR>

:set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap <silent> <F3> :Grep<CR>
"�Զ���ȫ
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>

inoremap . .<C-X><C-O>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" mapping
" ��������˵��������س�ӳ��Ϊ���ܵ�ǰ��ѡ��Ŀ��������ӳ��Ϊ�س���
"
" ��������˵�������CTRL-Jӳ��Ϊ�������˵������·�ҳ������ӳ��ΪCTRL-X CTRL-O��
"
" ��������˵�������CTRL-Kӳ��Ϊ�������˵������Ϸ�ҳ��������ӳ��ΪCTRL-K��
"
" ��������˵�������CTRL-Uӳ��ΪCTRL-E����ֹͣ��ȫ��������ӳ��ΪCTRL-U��
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"

inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"a

inoremap <expr> <cr>       pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n>      pumvisible() ? "\<c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
inoremap <expr> <m-;>      pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""


"ѡ��һ�����ֲ�ȫ�������������
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" ֻ�������ļ����ͱ���⵽��ʱ����ʾ�кţ���ͨ�ı��ļ�����ʾ

:runtime! ftplugin/man.vim
set keywordprg=dicty
"ab ssh #!/bin/bash<CR><CR>
"ab ppy #!/usr/bin/python<CR><CR>
"ab ppl #!/usr/bin/perl<CR><CR><{}>
"ab rru #!/usr/bin/ruby<CR><CR><{}>

set fileencodings=utf-8,gb18030,utf-16,big5

let OmniCpp_MayCompleteDot=1        "��.������
let OmniCpp_MayCompleteArrow=1      "��->������
let OmniCpp_MayCompleteScope=1      "��::������
let OmniCpp_NamespaceSearch=1       "�������ռ�
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1   "����ʾ����ԭ��
let OmniCpp_SelectFirstItem = 0     "�Զ�����ʱ�Զ�������һ��

" Line highlight �O�˘����Е����]�ɫ
" ������ǰ��
set cursorline
" Column highlight �O�����[�����Е����]�ɫ
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


