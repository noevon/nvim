let mapleader="\<space>"
nmap ts <Plug>(coc-translator-p)
"nnoremap <c-p> :Leaderf file<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <C-l> :Lines<CR>
"noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>
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

noremap <c-d> :BD<CR>



"=======================
" coc.nvim
"=======================

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <LEADER>+ <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-next)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" ----------------------
" vax 快捷键移植
" ----------------------
" 打开文件列表 alt+shift+o
nnoremap <silent> <A-O> :Files<CR>
" 跳转定义 alt+g
nmap <silent> <m-g> <Plug>(coc-definition)
" 查找引用 shift+alt+f
nmap <silent> <m-F> <Plug>(coc-references)
" 查找字符串 ctrl+shift+f
nnoremap <silent> <C-F> :Rg<CR>
" 切换头文件 alt+o
nnoremap <silent> <m-o> :CocCommand clangd.switchSourceHeader<CR>
" 替换名字
nnoremap <leader>rn <Plug>(coc-rename)
" 查看符号表 alt+m
noremap <m-m> :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
"预览声明.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR> 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



"------------------------
"window
"------------------------
nmap <m-e> <Plug>(choosewin)

"------------------------
"insert
"------------------------
" 删除前一个字符 c-u 
" 删除前一个单词 c-w
" 删除到行首    c-u
"move to next word
inoremap <C-F> <Esc>wwwi
"move to prev word
inoremap <C-B> <Esc>bi

