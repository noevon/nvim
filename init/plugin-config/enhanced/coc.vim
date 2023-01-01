
" coc.nvim
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-pairs',  
	\ 'coc-translator',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-vimlsp',
	\ 'coc-highlight', 
	\ 'coc-cmake', 
	\ 'coc-clangd',
	\ 'coc-marketplace',
	\ 'coc-sh',
	\ 'coc-explorer',
	\ 'coc-go',
	\ 'coc-tsserver'
	\]
"coc-explorer
nmap <leader>e <Cmd>CocCommand explorer --quit-on-open<CR>

helptags ~/.config/nvim/doc/

" translator
nmap <Leader>t <Plug>(coc-translator-p)
"nmap <Leader>tp <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-ev)
