Plug 'skywind3000/asynctasks.vim' 
Plug 'skywind3000/asyncrun.vim'
"新开一个
let g:asynctasks_term_pos = 'thelp'
" 复用
"let g:asynctasks_term_reuse = 1
" 焦点不变
" let g:asynctasks_term_focus = 0

"asyncrun
let g:asyncrun_open = 6
" asynctasks
" 编译运行任务,参考https://github.com/skywind3000/asynctasks.vim/
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f8> :AsyncTask project-build<cr>
" [project-build]
" command=make
" # 设置在当前项目的根目录处运行 make
" cwd=$(VIM_ROOT)
" 
" [project-run]
" command=make run
" # <root> 是 $(VIM_ROOT) 的别名，写起来容易些
" cwd=<root>
" output=terminal
