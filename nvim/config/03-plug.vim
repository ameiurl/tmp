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
Plug 'romgrk/nvim-treesitter-context'

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
" Plug 'ojroques/vim-scrollstatus'

" tags
Plug 'ludovicchabant/vim-gutentags'				   " 提供 ctags/gtags 后台数据库自动更新功能
Plug 'skywind3000/gutentags_plus'				   " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
Plug 'skywind3000/vim-preview'					   " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览

" coc自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'ameiurl/vim-snippets'
" Plug 'mattn/emmet-vim'							   " <c-e> html代码补全

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
Plug 'tpope/vim-fugitive'						   " :Git log O新窗口打开,Gclog
Plug 'kdheepak/lazygit.nvim'					   " <leader>g

" 搜索
Plug 'brooth/far.vim'							   " <LocalLeader>f t s u
" Plug 'jremmen/vim-ripgrep'						   " <leader>v <leader>vv
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
" == emmet
" ==
" let g:user_emmet_expandabbr_key = '<C-o>'


" ==
" == far
" ==
let g:far#enable_undo=1
let g:far#source='ag'
" :Farr foo bar **/*.py   t s u
noremap <LocalLeader>f :Far  **/*.php<left><left><left><left><left><left><left><left><left>


" ==
" == fzf
" ==
" map <Leader>f :Files<CR>
" map <leader>h :History<CR>
" map <leader>b :Buffers<CR>
" map <leader>l :Lines<CR>
" command! -bang -nargs=* Rg call fzf#vim#ag(<q-args>, '--color-path "1;39" --color-line "1;30" --color-match "1;31" --color-line-number "1;31"', 
"   \					<bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
"command! -bang -nargs=* Sg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
"nnoremap <silent> <Leader>s :Sg<CR>
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '20split enew' }
"let g:fzf_preview_window = 'right:60%'
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" ==
" == gutentags_plus
" ==
" You can disable the default keymaps by:
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1


" ==
" == vim-gutentags
" ==
source ~/.config/nvim/gtags/gtags.vim
source ~/.config/nvim/gtags/gtags-cscope.vim

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 " ctrl + ] 跳转下一个
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰
" 使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0
" 输出错误:GutentagsToggleTrace :messages  权限问题 或 删除~/.cache/tags/
" let g:gutentags_define_advanced_commands = 1


" ==
" == lazygit 
" ==
nnoremap <silent> <leader>g :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ==
" == Rg
" ==
" nnoremap <silent> <Leader>v :Rg 
" nnoremap <silent> <Leader>vv :Rg<CR>
" let g:rg_highlight = 'true'


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
" == preview 
" ==
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"noremap <Leader>u :PreviewScroll -1<cr>
"noremap <leader>d :PreviewScroll +1<cr>


" ==
" == vim-visual-multi  
" ==
"let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
"let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
"let g:VM_maps['i']                  = 'm'
"let g:VM_maps['I']                  = 'M'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
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
--require('plugins.lsp.lsp-install')
--require('plugins.lsp.lsp-config')
--require('plugins.lsp.nvim-cmp')
--require('plugins.lsp')
--require('plugins.vista')
EOF
