" 导入vim插件管理文件
" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif


filetype plugin indent on
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 基本配置

colorscheme molokai "theme
syntax on " 开启语法高亮
set nu
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set mouse=a      " 启动鼠标所有模式，但是右键功能不可用, 可以保证鼠标滚屏在当前屏幕内
set mousehide    " 输入文件时隐藏鼠标
set laststatus=2  " 总是显示状态栏
" set cursorcolumn " 突出显示当前列
" set cursorline " 突出显示当前行
set title " change the terminal's title
set novisualbell " 去掉输入错误的提示声音
set noerrorbells
set t_vb=
set tm=500
set ruler " 显示当前的行号列号
set showcmd " 在状态栏显示正在输入的命令
set showmode " 左下角显示当前vim模式
set scrolloff=7 " 在上下移动光标时，光标的上方或下方至少会保留显示的行数

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2 " 命令行（在状态行下）的高度，默认为1，这里是2


set number " 显示行号
set nowrap " 取消换行
set showmatch " 括号配对情况, 跳转并高亮一下匹配的括号
set matchtime=2 " How many tenths of a second to blink when matching brackets




" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase


" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

"{{{ 主题设置
set t_Co=256       " 开启256色支持
"}}}


" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"====================airline======================
let g:airline_section_y = '%{strftime("%H:%M")}'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1


" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"=================================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"							nerdtree
"
"不显示帮助信息
 let NERDTreeMinimalUI=1
"鼠标点击							 
 let NERDTreeMouseMode = 2
"宽度
 let g:NERDTreeWinSize = 30
"忽略文件、隐藏文件
 let NERDTreeIgnore = ['\.pyc$']
 let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
 nmap wm :NERDTreeToggle<cr>
"关闭当前窗口
 nmap wc      <C-w>c     
"分割窗口
 nmap wv      <C-w>v     
"打开quickfix
 nmap wq :copen<cr>
"分割窗口移动快捷键
 nnoremap <c-h> <c-w>h
 nnoremap <c-j> <c-w>j
 nnoremap <c-k> <c-w>k
 nnoremap <c-l> <c-w>l

nnoremap <F10> :NERDTreeToggle<CR>
"autocmd BufRead *.py :NERDTreeToggle
"关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()" 
"新建.py,.cc,.java,.sh,  
""定义函数SetTitle，自动插入文件头  
func SetTitle()  
        "如果文件类型为.sh文件  
        if &filetype == 'python'  
		call setline(1, "\# /usr/bin/python") 
                call setline(2, "\# -*-coding=utf8-*-")  
                call setline(3, "\"\"\"")  
                call setline(4, "\# Author: andrew")  
                call setline(5, "\# Created Time : ".strftime("%c"))  
                call setline(6, "")  
                call setline(7, "\# File Name: ".expand("%"))  
                call setline(8, "\# Description:")  
                call setline(9, "")  
                call setline(10, "\"\"\"")  
                call setline(11,"")  
        endif  
        if &filetype == 'java'  
                call setline(1, "//-*-coding=utf8-*-")  
                call setline(2, "/*************************************************************************")  
                call setline(3, "\ @Author: andrew")  
                call setline(4, "\ @Created Time : ".strftime("%c"))  
                call setline(5, "")  
                call setline(6, "\ @File Name: ".expand("%"))  
                call setline(7, "\ @Description:")  
                call setline(8, "")  
                call setline(9, " ************************************************************************/")  
                call setline(10,"")  
        endif  
endfunc


" modify the last modified time of a file  
function SetLastModifiedTime(lineno)  
        let modif_time = strftime("%c")  
        if a:lineno == "-1"  
                let line = getline(6)  
        else  
                let line = getline(a:lineno)  
        endif      
        if line =~ '^////\sLast Modified'  
                let line = substitute( line,':\s\+.*\d\{4\}', ':'.modif_time, "" )  
        else  
                let line = '  Last Modified: '.modif_time  
        endif  
        if a:lineno == "-1"  
                call setline(5, line)  
        else  
                call append(a:lineno, line)  
        endif  
endfunction  
  
" map the SetLastModifiedTime command automatically  
au BufWrite *.py,*.java call SetLastModifiedTime(-1)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 docstring
nmap <silent> <C-a> <Plug>(pydocstring)
"template
""""
":param {{_args_}}:
"{{_indent_}}:return:
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ctags
"
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"let Tlist_Ctags_Cmd='/usr/Cellar/ctags/5.8/bin/ctags'
"map <F9> :ctags -R * <CR>
"用法：$ ctags –R src
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				tagbar
"autocmd BufRead *.* nmap tb :Tagbar<cr>
"let tagbar_ctags_bin='/usr/bin/ctags'
"let tagbar_width=35
"let g:tagbar_compact = 1
"let g:tagbar_autoshowtag = 1
"let Tlist_Show_One_File=1  
"let Tlist_Exit_OnlyWindow=1 
"nnoremap <F8> :TlistToggle<CR>
"nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
map <F3> :Tagbar<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ========================taglist=================================================
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1                "在左侧窗口中显示taglist窗口
nnoremap <F8> :TlistToggle<CR>
"==================================================================================



