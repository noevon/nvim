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

"
"
" 重载文件
nnoremap <Leader>vr :source $MYVIMRC<CR>

" ----------------------
" 跳转快捷键
" ----------------------
" 查看buff
nnoremap <leader>b :Buffers<CR> 
" 查找字符串
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\  "rg --column --line-number --color=always ".shellescape(<q-args>), 1, 
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
noremap <leader>m :Vista!!<CR>
"noremap <C-t> :BTags<CR>
"nnoremap <c-p> :Leaderf file<CR>
noremap <c-t> :silent! Vista finder coc<CR>
"预览声明 K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent>K :call <SID>show_documentation()<CR>
" 跳转buff
nnoremap <m-e> <Plug>(choosewin)

"--------------------------------------------------------
"插件快捷键

" simpylfold
" zc 代码折叠
" zo 代码展开

" skywind3000/vim-terminal-help
" <m-=> 开启终端



