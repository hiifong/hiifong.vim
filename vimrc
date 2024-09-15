"=============================================
"  _      _  _   __                     
" | |    (_)(_) / _|                    
" | |__   _  _ | |_  ___   _ __    __ _ 
" | '_ \ | || ||  _|/ _ \ | '_ \  / _` |
" | | | || || || | | (_) || | | || (_| |
" |_| |_||_||_||_|  \___/ |_| |_| \__, |
"                                  __/ |
"                                 |___/ 
"
" CopyRight hiifong <i@hiif.ong>
"
"=============================================

set nocompatible
filetype plugin indent on	" 开启文件类型检测
syntax on		" 开启语法高亮
set shiftwidth=4	" 缩进的宽度

set backspace=indent,eol,start		" 智能回删

set number		" 显示行号
set relativenumber	" 显示相对行号

set cursorcolumn	" 高亮当前列
set cursorline		" 高亮当前行

set smartindent		" 智能缩进

set encoding=UTF-8	" 设置编码
set guifont=Cascadia_Code:h16	" 设置字体
set t_Co=256			" 开启256色

" set laststatus=3	" 显示状态栏
" set showcmd		" 显示输入的命令
" set wildmenu		" Vim命令提示

set autoread		" 自动加载外部修改
set autowrite		" 自动保存
set confirm		" 未保存确认

set history=1024
set undofile
set undodir=~/.vim/.history

"===> Plugins
call plug#begin()
  Plug 'preservim/nerdtree'		" 文件管理
  Plug 'ryanoasis/vim-devicons'		" 文件类型icon
  Plug 'vim-airline/vim-airline'	" 底部状态行
  " Plug 'vim-airline/vim-airline-themes'	" vim-airline主题
  Plug 'rakr/vim-one'			" vim-airline one主题
  Plug 'tpope/vim-pathogen'		" 运行时路径管理
  Plug 'vim-syntastic/syntastic'	" 语法检查
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }	" go开发插件
  Plug 'mhinz/vim-startify'		" 启动页
call plug#end()
" Plugins <===

" ===> 配置


" ===> vim airline

let g:airline#extensions#tabline#enabled = 1 			" 标签栏
let g:airline#extensions#tabline#formatter = 'unique_tail' 	" 路径格式化
let g:airline_powerline_fonts = 1				" 设置vim-airline字体
let g:airline_theme='one'					" 设置vim-airline主题
colorscheme one		" 配色方案
set background=dark	" 背景

" vim airline <===

" ===> one
let g:one_allow_italics = 1	" 开启斜体评论
" one#highlight(group, fg, bg, attribute)
" - group: Highlight you want to customise for example vimLineComment
" - fg: foreground color for the highlight, without the '#', for example: ff0000
" - bg: background color for the highlight, without the '#', for example: ff0000
" - attribute: bold, italic, underline or any comma separated combination
call one#highlight('vimLineComment', '7b7e84', '', 'italic') " 设置评论样式
" one <===

" ===> vim-pathogen
execute pathogen#infect()
" vim-pathogen <===

" ===> syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" syntastic <===

" ===> vim-startify
let g:startify_custom_header=
	    \ startify#pad(readfile('/Users/hiifong/.vim/vim-ascii.txt'))


" 配置 <===

