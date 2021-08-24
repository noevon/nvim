
call plug#begin('~/.config/nvim/plugged')
Plug 'Yggdroot/indentLine' " 缩进线显示
Plug 'liuchengxu/vista.vim'  " taglist插件
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'skywind3000/vim-terminal-help', " 终端 alt+=
Plug 'junegunn/fzf.vim' "模糊查找
Plug 'Yggdroot/LeaderF' "模糊查找
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround' " 包裹插件 type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'yianwillis/vimcdoc' " 中文帮助插件
Plug 't9md/vim-choosewin' " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
Plug 'rafi/awesome-vim-colorschemes' " 主题
Plug 'mg979/vim-xtabline' " 顶栏
Plug 'jackguo380/vim-lsp-cxx-highlight' "lsp高亮
Plug 'skywind3000/asynctasks.vim' "编译运行任务,参考https://github.com/skywind3000/asynctasks.vim/
Plug 'skywind3000/asyncrun.vim'
Plug 'MattesGroeger/vim-bookmarks' 
call plug#end()
" coc.nvim
let g:coc_global_extensions = [
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
"======================
" fzf
"======================
set rtp+=~/.fzf/bin/fzf
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

"=======================
"  monokai
"=======================
syntax enable
set background=dark
colorscheme sonokai
" colorscheme spacecamp

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

"asynctasks
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>
"asyncrun
let g:asyncrun_open = 6


"coc-explorer
nmap <space>e :CocCommand explorer<cr>


" vim-bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_display_annotation = 1
" 书签存储到根目录的.bookmarks
function! g:BMWorkDirFileLocation()
	let filename = 'bookmarks'
	let rootdir = asyncrun#get_root('%')
	return rootdir."/.".filename
endfunction
