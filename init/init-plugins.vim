" 插件分组
if !exists('g:plugged_group')
	let g:plugged_group = ['basic', 'textobj', 'enhanced', 'beautify', 'debug']
endif
	
call plug#begin('~/.config/nvim/plugged')
LoadScript init/plugin-config/basic/basic.vim
LoadScript init/plugin-config/textobj/textobj.vim
LoadScript init/plugin-config/enhanced/enhanced.vim
LoadScript init/plugin-config/beautify/beautify.vim
call plug#end()
