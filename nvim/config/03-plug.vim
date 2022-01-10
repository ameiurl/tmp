"""""""" 插件管理vim-plug""""""""
call plug#begin('~/.config/nvim/plugged')
" 美化
Plug 'vim-airline/vim-airline'                     " 状态栏增强
Plug 'vim-airline/vim-airline-themes'              " 状态栏增强

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" fuzzy finders
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" 文件目录树
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

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
Plug 'ojroques/vim-scrollstatus'
Plug 'danilamihailov/beacon.nvim'

" tags
Plug 'ludovicchabant/vim-gutentags'				   " 提供 ctags/gtags 后台数据库自动更新功能
Plug 'skywind3000/gutentags_plus'				   " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
Plug 'skywind3000/vim-preview'					   " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览

" coc自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'ameiurl/vim-snippets'
Plug 'mattn/emmet-vim'							   " <c-e> html代码补全

"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'onsails/lspkind-nvim'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " F11启动:InstantMarkdownPreview

" Git
Plug 'lewis6991/gitsigns.nvim'					   " show git status [c上一个 ]c下一个
Plug 'tpope/vim-fugitive'						   " :Git log 
Plug 'kdheepak/lazygit.nvim'					   " <leader>g

" 搜索
Plug 'brooth/far.vim'							   " <LocalLeader>f t s u
Plug 'jremmen/vim-ripgrep'						   " <leader>v <leader>vv
call plug#end()

let mapleader=','
let g:mapleader=','
let g:maplocalleader=';'

let s:curdir = fnamemodify(fnamemodify(resolve(expand('<sfile>:p')), ':h'), ':h')
for fpath in split(globpath(expand(s:curdir.'/config/plugins'), '*.vim'), '\n')
  exe 'source' fpath
endfor

lua <<EOF
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.nvim-autopairs')
require('plugins.comment')
--require('plugins.lsp.lsp-install')
--require('plugins.lsp.lsp-config')
--require('plugins.lsp.nvim-cmp')
--require('plugins.lsp')
--require('plugins.vista')
EOF
