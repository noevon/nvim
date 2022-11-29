let mapleader="\<space>"
fun! Copytoregy()
	let @y = @/[4:-3] "获取搜索寄存器里面的字符串
	"echo @y
endf
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ----------------------
" 跳转快捷键
" ----------------------
" 查看buff
nnoremap <leader>b :Buffers<CR> 
" 查找文件
nnoremap <leader>f :Rg<CR>
" 跳转定义 leader+g
nnoremap <leader>g <Plug>(coc-definition)
"文件历史记录
nnoremap <leader>h :History<CR>
" 跳转行
nnoremap <leader>l :Lines<CR>
" 打开文件列表 
fun! Fzf_OpenFile() 
	let cmd = (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
	return cmd
endf
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <expr><leader>o Fzf_OpenFile()
" nnoremap <leader>o :Files<CR>
" 查找引用 
nnoremap <leader>r <Plug>(coc-references)
" 切换头文件 alt+o
noremap <silent> <m-o> :CocCommand clangd.switchSourceHeader<CR>
" 替换名字
nnoremap <leader>rn <Plug>(coc-rename)
" 查看符号表 alt+m
noremap <m-m> :Vista!!<CR>
"noremap <C-t> :BTags<CR>
"nnoremap <c-p> :Leaderf file<CR>
noremap <c-t> :silent! Vista finder coc<CR>
"预览声明.
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR> 
" 跳转buff
nnoremap <m-e> <Plug>(choosewin)

"--------------------------------------------------------
"插件快捷键

" simpylfold
" zc 代码折叠
" zo 代码展开

" vim-bookmarks
" mm 当前行加入书签
" mi 编辑书签注释
" mg 移动书签
" ma 查看所有书签

" skywind3000/vim-terminal-help
" <m-=> 开启终端

" easymotion/vim-easymotion
" 快速跳转<leader><leader>f{char} 即可触发

" asynctasks
" 编译运行任务,参考https://github.com/skywind3000/asynctasks.vim/
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f8> :AsyncTask project-build<cr>

" translator
nmap <Leader>t <Plug>(coc-translator-p)
"nmap <Leader>tp <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-ev)

