Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
function! s:gdb_session_init()
	print "helllppp"
	if filereadable('.gdb.temp') 
" 		修改.gdbinit
"		define hook-quit
"				shell echo > .gdb.temp
"				save breakpoints .gdb.temp
"		end
	endif
	"execute("source .gdb.temp")
"	execute(':belowright GdbCreateWatch info locals')
"	execute(':set wrap')
"	execute(':wincmd k')
endfunction
autocmd User NvimGdbStart :call <SID>gdb_session_init()

function! s:gdb_session_end()
"	execute(':wincmd h')
"	execute(':only')
endfunction
autocmd User NvimGdbCleanup :call <SID>gdb_session_end()
let g:nvimgdb_config_override = {
      \ 'codewin_command': 'new',
      \ 'termwin_command': 'vertical new',
      \ }
" <leader> dd 运行调试命令
" 进入调试后 
" f4 运行到当前行
" f8 添加断点
" f10 n 下一步
" f11 s 进入
" f12 finish
" <c-p> down
" <c-n> up
" 
