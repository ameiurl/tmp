"==========================================
" General Settings 基础设置
"==========================================

" 禁用 vi 兼容模式
set nocompatible

" history存储容量
set history=1000

" 检测文件类型
"filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread

" 取消备份。 视情况自己改
set nobackup

" 关闭交换文件
set noswapfile

" 突出显示当前行
set cursorline

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
"set t_ti= t_te=

" 鼠标暂不启用, 键盘党....
set mouse-=a

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
" set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
"set viminfo^=%

" For regular expressions turn magic on
"set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 三种缩进模式
set ai si ci

" set winwidth=79

" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number


" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

"split新窗口右侧底部
set splitright
set splitbelow

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

" 00x增减数字时使用十进制
set nrformats=

" 卡顿问题
"let g:loaded_matchparen=1
set lazyredraw "should make scrolling faster"
set ttyfast "same as above"

" 换行
set wrap

" 显示整个单词
set linebreak

" 解决自动换行格式下, 如折行之后高在超过窗口高度看不到最后一行的问题
set display+=lastline

"----------------------------------------------------------------------
" FileEncode Settings 文件编码,格式
"----------------------------------------------------------------------
"
" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

" 设置为搜索时不要回卷
set wrapscan

"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 折叠方法
	" manual    手工折叠
	" indent    使用缩进表示折叠
	" expr      使用表达式定义折叠
	" syntax    使用语法定义折叠
	" diff      对没有更改的文本进行折叠
	" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
	" 代码折叠默认使用缩进
	set fdm=indent
	
	" 默认打开所有缩进
	set foldlevel=99
endif

"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"==========================================
" others 其它设置
"==========================================

" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

" 回车即选中当前项
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :cclose<CR>

" quickfix高度
au FileType qf call AdjustWindowHeight(5, 20)
function! AdjustWindowHeight(minheight, maxheight)
	let l = 1
	let n_lines = 0
	let w_width = winwidth(0)
	while l <= line('$')
		" number to float for division
		let l_len = strlen(getline(l)) + 0.0
		let line_width = l_len/w_width
		let n_lines += float2nr(ceil(line_width))
		let l += 1
	endw
	exe max([min([n_lines, a:maxheight]), a:minheight]) .  "wincmd _"
endfunction

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" tags; 
set tags=./.tags;,.tags

" 设置退出vim后，不显示文件内容
if &term =~ "xterm"
    " SecureCRT versions prior to 6.1.x do not support 4-digit DECSET
    "    let &t_ti = "\<Esc>[?1049h"
    "    let &t_te = "\<Esc>[?1049l"
    " Use 2-digit DECSET instead
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

"标签高亮匹配
runtime macros/matchit.vim 

" 系统剪贴板
set clipboard+=unnamedplus

"最后一个窗口，quickfix一起关闭
"aug QFClose
"	au!
"	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
"aug END
"
""##### auto fcitx  ###########
"let g:input_toggle = 1
"function! Fcitx2en()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status == 2
"      let g:input_toggle = 1
"      let l:a = system("fcitx-remote -c")
"   endif
"endfunction
"
"function! Fcitx2zh()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status != 2 && g:input_toggle == 1
"      let l:a = system("fcitx-remote -o")
"      let g:input_toggle = 0
"   endif
"endfunction
"
"set ttimeoutlen=50
""Exit insert mode
"autocmd InsertLeave * call Fcitx2en()
""Enter insert mode
"autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

"if empty(glob('~/.config/nvim/autoload/plug.vim'))
	"silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				"\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif


"""""""" 插件管理vim-plug""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'                     " 状态栏增强
Plug 'vim-airline/vim-airline-themes'              " 状态栏增强
Plug 'ameiurl/zend.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'romgrk/nvim-treesitter-context'

" fuzzy finders
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" 文件目录树
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" coc自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ameiurl/vim-snippets'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " F11启动:InstantMarkdownPreview

" Git
Plug 'lewis6991/gitsigns.nvim'					   " show git status [c上一个 ]c下一个
Plug 'tpope/vim-fugitive'						   " :Git log O新窗口打开,Gclog
Plug 'cohama/agit.vim'

" vim补助
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'              " 让vim能兼容tmux
Plug 'lambdalisue/suda.vim'                        " root权限直接输入密码
Plug 'mg979/vim-visual-multi',{'branch': 'master'} " <c-m>批量量更新
Plug 'terryma/vim-expand-region'                   " v/V 快速选择区域/取消选择区域
Plug 'junegunn/vim-easy-align'					   " <Leader>a符号 快速对齐
Plug 'numToStr/Comment.nvim'					   " 快速注释/解开注释
Plug 'kshenoy/vim-signature'					   " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
Plug 'hrsh7th/vim-eft'							   " 增强f|t操作，在摁下f|t时，会高亮可能需要跳转的字母
Plug 'windwp/nvim-autopairs'
Plug 'psliwka/vim-smoothie'						   " 滚动翻页效果插件
Plug 'machakann/vim-highlightedyank'			   " 复制效果
Plug 'brooth/far.vim'							   " <LocalLeader>f t s u
Plug 'liuchengxu/vista.vim'
call plug#end()

let mapleader=','
let g:mapleader=','
let g:maplocalleader=';'

" ==
" == COC
" ==
"可以在服务启动的时候，自动安装多个扩展插件
let g:coc_global_extensions = [
	\ 'coc-phpls',
	\ 'coc-json',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-xml',
	"\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-yank',
    \ 'coc-translator',
	\ 'coc-snippets' ]

inoremap <silent><expr> <TAB>
	"\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>l :CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> go <Plug>(coc-definition)
nmap <silent> gO :buffer sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gl <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-e> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-n>'
" imap <C-e> <Plug>(coc-snippets-expand-jump)
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ==
" == far
" ==
let g:far#enable_undo=1
let g:far#source='ag'
" :Farr foo bar **/*.py   t s u
noremap <LocalLeader>f :Far  **/*.php<left><left><left><left><left><left><left><left><left>

" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ==
" == lazygit 
" ==
" nnoremap <silent> <leader>g :LazyGit<CR>
" let g:lazygit_floating_window_winblend = 0 " transparency of floating window
" let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
" let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
" let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ==
" == suda
" ==
let g:suda_smart_edit = 1


" ==
" == vim-airline
" ==
let g:airline_theme="light" 
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1    " enable tabline
let g:airline#extensions#tabline#buffer_nr_show=1    " 显示buffer行号
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_section_x = '%{ScrollStatus()}'
" let g:airline_section_y = airline#section#create_right(['filetype'])
" let g:airline_section_z = airline#section#create([
"             \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
"             \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            " \ ])
"Airline Theme
" let g:airline_theme='nord_minimal'
"
let g:nord_uniform_diff_background = 0
"
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'searchcount', 'tabline', 'vista', 'coc']

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]
let g:airline#extensions#default#section_truncate_width = {
      \ 'z': 85,
      \ 'warning': 80,
      \ 'error': 80,
      \ }

" Customize vim airline per filetype
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'list': [ '%y', '%l/%L'],
  \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_right_sep = '«'
" let g:airline_symbols.branch = '⎇'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''

" Sections
"
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_c = airline#section#create(['hunks'])
  let g:airline_section_x = airline#section#create(['%f'])
  " let g:airline_section_z = airline#section#create(['linenr'])
  let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', '',
            \ '%#__accent_bold#%3v%#__restore__#/%{virtcol("$") - 1}',
            \ ])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

" ==
" == autopairs
" ==
let g:AutoPairsMapCh = 0


" ==
" == vim-easy-align
" ==
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
	let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String']  }


" ==
" == vim-eft
" ==
nmap ; <Plug>(eft-repeat)
xmap ; <Plug>(eft-repeat)

nmap f <Plug>(eft-f)
xmap f <Plug>(eft-f)
omap f <Plug>(eft-f)
nmap F <Plug>(eft-F)
xmap F <Plug>(eft-F)
omap F <Plug>(eft-F)

nmap t <Plug>(eft-t)
xmap t <Plug>(eft-t)
omap t <Plug>(eft-t)
nmap T <Plug>(eft-T)
xmap T <Plug>(eft-T)
omap T <Plug>(eft-T)


" ==
" == vim-expand-region
" ==
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i)'  :1,
      \ 'i]'  :1,
      \ 'i}'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ 'it'  :0,
	  \}


" ==
" == instant-markdown 
" ==
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

map <F11> :InstantMarkdownPreview<CR>


" ==
" == vim-markdown 
" ==
let g:vim_markdown_folding_disabled=1


" ==
" == vim-visual-multi  
" ==
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
"let g:VM_maps['i']                  = 'm'
"let g:VM_maps['I']                  = 'M'
let g:VM_maps['Find Under']         = '<C-m>'
let g:VM_maps['Find Subword Under'] = '<C-m>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-x>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" ==
" == vista 
" ==
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_executive_for = {
			\ 'cpp': 'coc',
			\ 'php': 'coc',
			\ }
let g:vista_ctags_cmd = {
			\ 'haskell': 'hasktags -x -o - -c',
			\ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
nnoremap <silent> <Leader>t :<C-u>Vista!!<CR>
autocmd FileType vista nnoremap <silent><Esc> :Vista!<CR>
let g:vista_ignore_kinds = ['Variable']


lua <<EOF
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.nvim-autopairs')
require('plugins.comment')
EOF


"--------------------------自定义快捷键---------------------

" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

map <leader>zz :call ToggleFold()<cr>

" ===============================================
" === 标签管理===================================
" ===============================================

" buffer
map <C-n> :bnext<cr>
map <C-p> :bprev<cr>
map <leader>1 :bfirst<cr>
map <leader>2 :b2<cr>
map <leader>3 :b3<cr>
map <leader>4 :b4<cr>
map <leader>5 :b5<cr>
map <leader>6 :b6<cr>
map <leader>7 :b7<cr>
map <leader>8 :b8<cr>
map <leader>9 :b9<cr>
map <leader>0 :blast<cr>
map <leader>d :bd<cr>
map <C-o>     :b#<CR>

" Toggles between the active and last active tab "
" Switch to last-active tab
"if !exists('g:Lasttab')
    "let g:Lasttab = 1
    "let g:Lasttab_backup = 1
"endif
"autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
"autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
"nnoremap <silent> <c-o> :exe "tabn " . g:Lasttab<cr>

" 新建tab  Ctrl+t
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>


" ===============================================
" === 窗口管理===================================
" ===============================================

"Treat long lines as break lines (useful when moving around in them)
""se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j"

" Ctrl+j k h l窗口直接跳转
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" 绑定插入模式下的方向键
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ===============================================
" === 快捷键 ===================================
" ===============================================

"nnoremap cc dd
"nnoremap x "_x
"nnoremap X "_X
"nnoremap d "_d
"nnoremap dd "_dd
"nnoremap D "_D
"vnoremap d "_d
"vnoremap dd "_dd
xnoremap p "_dP

" 调整缩进后自动选中，方便再次操作
"vmap <tab> >gv
"vmap <s-tab> <gv
vnoremap < <gv
vnoremap > >gv

" map Y y$

" Go to home and end using capitalized directions
" noremap H ^
" noremap L $

" Shift+HJKL快速移动
nnoremap K <Esc>5<up>
nnoremap J <Esc>5<down>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nnoremap <C-w> 8<C-e>
nnoremap <C-i> 8<C-y>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Map ; to : and save a million keystrokes 用于快速进入命令行
"nnoremap ; :

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" 选中并高亮最后一次插入的内容
"nnoremap gv `[v`]

" Quickly save the current file
nnoremap <leader>w :w<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Delete find pair
nnoremap dy d%

" 复制选中区到系统剪切板中
"vnoremap <leader>y "+y

" select block
"nnoremap <leader>v V`}

" 去掉搜索高亮
noremap <silent><Leader>/ :nohls<CR>

" select all
map <Leader>sa ggVG

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 命令行模式增强
cnoremap <C-a> <Home>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <S-Left>
cnoremap <C-e> <S-Right>

noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <right> :vertical res -10<CR>
noremap <left> :vertical res +10<CR>

" Disable the default s key
noremap s <Nop>

" w!! to sudo & write a file
"cmap w!! w !sudo tee >/dev/null %

" Compile function
noremap <Leader>p :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
"if has("gui_running")
"    set guifont=Monaco:h14
"    if has("gui_gtk2")   "GTK2
"        set guifont=Monaco\ 12,Monospace\ 12
"    endif
"    set guioptions-=T
"    set guioptions+=e
"    set guioptions-=r
"    set guioptions-=L
"    set guitablabel=%M\ %t
"    set showtabline=1
"    set linespace=2
"    set noimd
"    set t_Co=256
"endif

" theme主题
"set background=dark

set t_Co=256

" colorscheme molokai
colorscheme zend
" colorscheme deus
" colorscheme onedark

"----------------------------------------------------------------------
" 状态栏设置
"----------------------------------------------------------------------
"set statusline=                                 " 清空状态了
"set statusline+=\ %F                            " 文件名
"set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
"set statusline+=%=                              " 向右对齐
"set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
"set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)
" 命令行（在状态行下）的高度，默认为1，这里是2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 设置可以高亮的关键字
"if has("autocmd")
"  " Highlight TODO, FIXME, NOTE, etc.
"  if v:version > 701
"    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
"    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
"    autocmd Syntax * call matchadd('phpTodo', '<?php\|?>\|<?=')
"    autocmd Syntax * call matchadd('phpKeyword', 'empty\|isset')
"    " autocmd Syntax * call matchadd('htmlLink', '<a\|<\/a>\|<img\|src\|href\|<input\|<form\|</form>')
"  endif
"endif

" highlightedyank
let g:highlightedyank_highlight_duration = 500
highlight HighlightedyankRegion ctermfg=black ctermbg=214

" telescope
" highlight TelescopeSelectionColor ctermfg=white ctermbg=yellow
highlight TelescopeMatchingColor ctermfg=88
" highlight default link TelescopeSelection TelescopeSelectionColor 
highlight default link TelescopeMatching TelescopeMatchingColor 

" Agit
highlight agitDiffRemoveColor ctermfg=88
highlight agitDiffAddColor ctermfg=28
highlight agitDiffFileNameColor ctermfg=blue
highlight agitDiffIndexColor ctermfg=blue

hi def link agitDiffRemove agitDiffRemoveColor 
hi def link agitDiffAdd agitDiffAddColor
hi def link agitDiffFileName agitDiffFileNameColor 
hi def link agitDiffIndex agitDiffIndexColor 
hi def link agitDiffSubname agitDiffIndexColor 
