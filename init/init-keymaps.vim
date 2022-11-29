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

" ----------------------
" 跳转快捷键
" ----------------------
" 查看buff
nnoremap <leader>b :Buffers<CR> 
" 查找字符串
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\  "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, 
	\  {'options': '--delimiter : --nth 4..'}, <bang>0)

function! s:run_myrg()
	execute "Rg"." ".expand("<cword>")
endf
nnoremap <leader>f :call <SID>run_myrg()<CR>
" 跳转定义 leader+g
nnoremap <leader>g <Plug>(coc-definition)
"文件历史记录
nnoremap <leader>h :History<CR>
" 跳转行
nnoremap <leader>l :Lines<CR>

" 打开文件列表 
function! s:open_filelist() 
	" 忽略.gitignore中的文件
	let cmd = len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached'
	execute cmd
endf
nnoremap <leader>o :call <SID>open_filelist()<CR>

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
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
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

