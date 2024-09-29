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
" Copyright hiifong <i@hiif.ong>
"
"=============================================

set nocompatible	" 关闭兼容模式
filetype plugin indent on	" 开启文件类型检测
syntax on		" 开启语法高亮
set shiftwidth=4	" 缩进的宽度

set backspace=indent,eol,start		" 智能回删

set number		" 显示行号
set relativenumber	" 显示相对行号

" set cursorcolumn	" 高亮当前列
" set cursorline		" 高亮当前行

set smartindent		" 智能缩进

set encoding=UTF-8	" 设置编码
set guifont=Cascadia_Code:h16	" 设置字体
set t_Co=256			" 开启256色

set scrolloff=5		" 屏幕顶部/底部保持 5 行文本
set laststatus=2	" 显示状态栏
set showcmd		" 显示输入的命令
set wildmenu		" Vim命令提示
set nobackup		" 不生成临时文件
set noswapfile		" 不生成 swap 文件

set autoread		" 自动加载外部修改
set autowrite		" 自动保存
set confirm		" 未保存确认

set incsearch		" 开启实时搜索
set ignorecase		" 关闭大小写区分

set history=1024
set undofile
set undodir=$HOME/.vim/.undodir

set mouse=a		" 启用鼠标
set clipboard=unnamed	" 使用剪切板

set background=dark	" 背景

let g:mapleader = ' '	" 使用空格键作为leader键
nnoremap <leader>h :echo 'Hello World'<enter>

autocmd BufReadPost *	" 把光标定位到上一次关闭时的位置
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif


"===> Plugins
call plug#begin()
  Plug 'preservim/nerdtree'		" 文件管理
  Plug 'vim-airline/vim-airline'	" 底部状态行
  " Plug 'vim-airline/vim-airline-themes'	" vim-airline主题
  Plug 'ryanoasis/vim-devicons'		" 文件类型icon
  Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
  " Plug 'rakr/vim-one'			" vim-airline one主题
  Plug 'tpope/vim-pathogen'		" 运行时路径管理
  Plug 'roman/golden-ratio'		" 自动控制窗口大小
  " Plug 'vim-syntastic/syntastic'	" 语法检查
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }	" go开发插件
  Plug 'preservim/nerdcommenter'	" 注释插件
  Plug 'mhinz/vim-startify'		" 启动页
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}	" Markdown 文件预览
  Plug 'wellle/context.vim'		" 上下文
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" 搜索
  Plug 'junegunn/vim-easy-align'	" 内容对齐
  Plug 'Yggdroot/indentLine'		" 缩进对齐线
call plug#end()
" Plugins <===

" ===> 配置

" ===> nerdtree
" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=35
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" nerdtree <===


" ===> vim airline

let g:airline#extensions#tabline#enabled = 1 			" 标签栏
let g:airline_powerline_fonts = 1				" 设置vim-airline字体
let g:airline#extensions#whitespace#enabled = 0			" 关闭不可见字符的提示
let g:airline_theme='embark'					" 设置vim-airline主题

colorscheme embark		" 配色方案

" vim airline <===

" ===> embark
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
let g:embark_terminal_italics = 1

" embark <===

" ===> one
" let g:one_allow_italics = 1	" 开启斜体评论
" one#highlight(group, fg, bg, attribute)
" - group: Highlight you want to customise for example vimLineComment
" - fg: foreground color for the highlight, without the '#', for example: ff0000
" - bg: background color for the highlight, without the '#', for example: ff0000
" - attribute: bold, italic, underline or any comma separated combination
" call one#highlight('vimLineComment', '7b7e84', '', 'italic') " 设置评论样式
" one <===

" ===> vim-pathogen
execute pathogen#infect()
" vim-pathogen <===

" ===> syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" syntastic <===

" ===> vim-go
let g:go_info_mode='gopls'
let g:go_def_mode='gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" vim-go <===

" ===> nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" nerdcommenter <===


" ===> vim-startify
let g:startify_custom_header=
	    \ startify#pad(readfile('/Users/hiifong/.vim/vim-ascii.txt'))

" vim-startify <===

" ===> context.vim
let g:context_enabled = 1		" 开启上下文
let g:context_buftype_blacklist = []	" 对xxx文件禁用上下文

" context.vim <===

" ===> vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-easy-align <===

" ===> indentLine

" indentLine <===

" 配置 <===


" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>
imap <C-B> <Left>
imap <C-F> <Right>

" Navigation Between Windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Buffer Jump
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" Prev Tab
nnoremap <S-H> gT
" Next Tab
nnoremap <S-L> gt

" New Tab
nnoremap <Leader>t :tabnew<CR>
" Close Tab
nnoremap <Leader>w :tabclose<CR>

" NERDTree
nnoremap <C-E>     :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>

