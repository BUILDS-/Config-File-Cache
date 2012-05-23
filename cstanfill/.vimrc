set tabstop=4
set shiftwidth=4
set modeline "show modeline
set showcmd "show command as it is typed
set cindent "use c-style auto-indentation
set expandtab "use spaces!
set ic "case insensitive searching
"remap jj to escape
inoremap jj <Esc>
"F2 = previous buffer, F3 = next, F4 = close buffer, F5 = make
"F6 = make clean
noremap <F2> <Esc>:bp<CR>
noremap <F3> <Esc>:bn<CR>
noremap <F4> <Esc>:bd<CR>
noremap <F5> <Esc>:make<CR>
noremap <F6> <Esc>:make clean<CR>
inoremap <F2> <Esc>:bp<CR>
inoremap <F3> <Esc>:bn<CR>
inoremap <F4> <Esc>:bd<CR>
inoremap <F5> <Esc>:make<CR>
inoremap <F6> <Esc>:make clean<CR>
