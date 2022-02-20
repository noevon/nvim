" 插件分组
if !exists('g:plugged_group')
	let g:plugged_group = ['basic', 'textobj', 'airline', 'enhanced', 'beautify']
endif
	
call plug#begin('~/.config/nvim/plugged')
"----------------------------------------
" 基础插件
"----------------------------------------
if index(g:plugged_group, 'basic') >= 0
	"nvim-coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'yianwillis/vimcdoc' " 中文帮助插件
endif

"----------------------------------------
" textobj 全家桶
" 主要功能为快速选择文本,分为三部分
" [number] <command> [textobj]
" number 数量
" command 删除 (d)delete, 复制 (y)yank, 编辑 (c)change
" textobj
" 	分为两部分
" 	1.选择操作
" 		i(inner) 部分的 
" 		a(around) 包围的也就是包括符号
" 	2.选择obj范围
" 		(w)word 单词只包含字母
" 		(W)WORD 包括其他符号
" 		(s)sentence 句子
" 		(p)paragraph 段落
" 		(([{"'`<) 其他
" 		插件功能
" 		(f)function  函数文本功能
" 		(,) 插件功能:参数文本对象
" 全家福地址 https://github.com/kana/vim-textobj-user/wiki
"----------------------------------------
if index(g:plugged_group, 'basic') >= 0
	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'
	" 函数文本对象 f
	Plug 'kana/vim-textobj-function'
	" 参数文本对象 ,
	Plug 'sgur/vim-textobj-parameter'
endif

"----------------------------------------
" airline 状态栏
"----------------------------------------
if index(g:plugged_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_powerline_fonts = 0
	let g:airline_exclude_preview = 1
	let g:airline_section_b = '%n'
	let g:airline_theme='deus'
	let g:airline#extensions#branch#enabled = 0
	let g:airline#extensions#syntastic#enabled = 0
	let g:airline#extensions#fugitiveline#enabled = 0
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 0
	Plug 'mg979/vim-xtabline' " 顶栏
endif


"----------------------------------------
" enhanced 增强插件
"----------------------------------------
if index(g:plugged_group, 'enhanced') >= 0
	" fzf
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim' "模糊查找
	" set rtp+=~/.fzf/bin/fzf
	let g:fzf_preview_window = 'right:60%'
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
	
	"模糊查找
	Plug 'Yggdroot/LeaderF' 

	"编译运行任务,参考https://github.com/skywind3000/asynctasks.vim/
	Plug 'skywind3000/asynctasks.vim' 
	Plug 'skywind3000/asyncrun.vim'
	"asynctasks
	noremap <silent><f5> :AsyncTask file-run<cr>
	noremap <silent><f9> :AsyncTask file-build<cr>
	noremap <silent><f6> :AsyncTask project-run<cr>
	noremap <silent><f8> :AsyncTask project-build<cr>
	"新开一个
	let g:asynctasks_term_pos = 'thelp'
	" 复用
	"let g:asynctasks_term_reuse = 1
	" 焦点不变
	" let g:asynctasks_term_focus = 0
	
	"asyncrun
	let g:asyncrun_open = 6
	Plug 'tpope/vim-surround' " 包裹插件 type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`

	" vim-bookmarks 书签
	Plug 'MattesGroeger/vim-bookmarks' 
	let g:bookmark_save_per_working_dir = 1
	let g:bookmark_auto_save = 1
	let g:bookmark_display_annotation = 1
	" 书签存储到根目录的.bookmarks
	function! g:BMWorkDirFileLocation()
		let filename = 'bookmarks'
		let rootdir = asyncrun#get_root('%')
		return rootdir."/.".filename
	endfunction
	Plug 'liuchengxu/vista.vim'  " taglist插件
	Plug 'skywind3000/vim-terminal-help', " 终端 alt+=
	" 快速跳转<leader><leader>f{char} 即可触发
	Plug 'easymotion/vim-easymotion'
	" 代码折叠
	Plug 'tmhedberg/SimpylFold'
endif



"----------------------------------------
" beautify 增强插件
"----------------------------------------
if index(g:plugged_group, 'enhanced') >= 0
	Plug 'mhinz/vim-startify' "启动画面
	Plug 'Yggdroot/indentLine' " 缩进线显示
	Plug 't9md/vim-choosewin' " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 'rafi/awesome-vim-colorschemes' " 主题
	Plug 'jackguo380/vim-lsp-cxx-highlight' "lsp高亮
endif


call plug#end()
" coc.nvim
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-pairs',  
	\ 'coc-translator',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-vimlsp',
	\ 'coc-highlight', 
	\ 'coc-cmake', 
	\ 'coc-clangd',
	\ 'coc-marketplace',
	\ 'coc-sh',
	\ 'coc-explorer',
	\ 'coc-go']
helptags ~/.config/nvim/doc/

"=======================
"  monokai
"=======================
syntax enable
set background=dark
colorscheme sonokai
" colorscheme spacecamp

" indentLine
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
"=======================
" vista.vim
"=======================
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" 设置缓冲区
set hidden
" time
set updatetime=100
" 补全信息减少
set shortmess+=c
" 合并左边空白以及行号
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" 打开补全
inoremap <silent><expr> <c-o> coc#refresh()
" table选择补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车选择补全不换行 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
 

" 高亮选中
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
" translator
nmap <Leader>t <Plug>(coc-translator-p)
"nmap <Leader>tp <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-ev)

" textobj
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)



"coc-explorer
nmap <space>e :CocCommand explorer --quit-on-open<cr>



