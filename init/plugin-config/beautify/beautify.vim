
if index(g:plugged_group, 'beautify') >= 0
	Plug 'mhinz/vim-startify' "启动画面
	Plug 'Yggdroot/indentLine' " 缩进线显示
	Plug 't9md/vim-choosewin' " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 'rafi/awesome-vim-colorschemes' " 主题
	Plug 'jackguo380/vim-lsp-cxx-highlight' "lsp高亮
	"Plug 'sainnhe/sonokai'
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
