
if index(g:plugged_group, 'basic') >= 0
	"nvim-coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'yianwillis/vimcdoc' " 中文帮助插件
	LoadScript init/plugin-config/basic/nvim.vim
endif

