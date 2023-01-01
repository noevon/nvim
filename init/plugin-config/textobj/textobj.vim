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
if index(g:plugged_group, 'textobj') >= 0
	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'
	" 函数文本对象 f
	Plug 'kana/vim-textobj-function'
	" 参数文本对象 ,
	Plug 'sgur/vim-textobj-parameter'
endif
