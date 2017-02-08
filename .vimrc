" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ�� set confirm " �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-

let mapleader = ","

colo desert

"Taglist���������
let g:Tlist_Use_Right_Window=0
let g:Tlist_Show_One_File=1
let g:Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:pydiction_location='~/.vim/ftdetect/complete-dict'
let g:pydiction_menu_height = 3

let Tlist_WinWidth=40


"����ڴ������±߽�ʱ����߽�7�м���ʼ����
set so=7

"��ɫ
" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "����html��xml�ļ���ͨ��ctrl+_��closetag
    if has("autocmd")
        autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
        autocmd FileType go,c vmap <C-o> <ESC>'<i/*<CR><ESC>o<ESC>'>o*/
        autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
    endif " has("autocmd")
endif " exists(...)

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
let g:SuperTabDefaultCompletionType="<C-X><C-O>"



"�������
" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��
set autoindent

" ΪC�����ṩ�Զ�����
set smartindent

" ʹ��C��ʽ������
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


"���Լ����̵�ʱ���Զ����صĽű�
if getfsize(".vimscript")>0
    source .vimscript
endif

"valgrind ���
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

inoremap . .<C-X><C-O>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf



"ѡ��һ�����ֲ�ȫ�������������
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" ֻ�������ļ����ͱ���⵽��ʱ����ʾ�кţ���ͨ�ı��ļ�����ʾ

:runtime! ftplugin/man.vim
set keywordprg=dicty

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


