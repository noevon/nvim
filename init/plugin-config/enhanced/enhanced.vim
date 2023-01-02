if index(g:plugged_group, 'enhanced') >= 0
	LoadScript init/plugin-config/enhanced/fzf.vim
	LoadScript init/plugin-config/enhanced/gdb.vim
	"模糊查找
	Plug 'Yggdroot/LeaderF' 
	LoadScript init/plugin-config/enhanced/async.vim
	Plug 'tpope/vim-surround' " 包裹插件 type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
	LoadScript init/plugin-config/enhanced/vim-bookmarks.vim
	LoadScript init/plugin-config/enhanced/vista.vim
	LoadScript init/plugin-config/enhanced/vim-rooter.vim
	LoadScript init/plugin-config/enhanced/vim-oscyank.vim
	Plug 'skywind3000/vim-terminal-help', " 终端 <leader>=
	Plug 'easymotion/vim-easymotion'
	" 快速跳转<leader><leader>f{char} 即可触发
	let g:terminal_key = '<leader>='
	" 代码折叠
	Plug 'tmhedberg/SimpylFold'
	LoadScript init/plugin-config/enhanced/coc.vim
endif


