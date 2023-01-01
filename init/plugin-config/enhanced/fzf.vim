" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim' "模糊查找
" set rtp+=~/.fzf/bin/fzf
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
