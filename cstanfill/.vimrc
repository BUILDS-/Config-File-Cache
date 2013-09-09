set tabstop=4     "4-wide tabs
set shiftwidth=4  "4-wide indentation
set softtabstop=4 "backspace = 1 tab
set expandtab     "use spaces
set modeline      "show modeline
set showcmd       "show command as it is typed
set cindent       "use c-style auto-indentation
set ignorecase    "case insensitive searching

"remap jj to escape
inoremap jj <Esc>

"F2 = previous buffer, F3 = next, F4 = close buffer
"F5 = make, F6 = make clean
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

"load plugins
set runtimepath+=$HOME/.vim/
"let g:miniBufExplForceSyntaxEnable = 1

"lets C-s and C-q be capture by vim instead of the terminal
silent !stty -ixon > /dev/null 2>/dev/null


"F8 toggles tag browser
"C-s n/c open/close file tree
"C-s s toggle line numbers
nmap <F8> :TagbarToggle<CR>
nmap <C-s>t :NERDTree<CR>
nmap <C-s>c :NERDTreeClose<CR>
nmap <C-s>s :set number!<CR> 

autocmd FileType tex noremap <F5> <Esc>:!pdflatex %<Cr><Cr>
autocmd FileType tex noremap <F6> <Esc>:silent !evince %<.pdf >/dev/null 2>&1 &<Cr><Cr>
