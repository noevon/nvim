let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'
LoadScript init/init-basic.vim
LoadScript init/init-keymaps.vim
LoadScript init/init-plugins.vim
LoadScript init/init-self.vim
" basevim

