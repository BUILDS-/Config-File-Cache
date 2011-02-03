set tabstop=4
set showcmd

autocmd BufNewFile *.tex 0r /home/george/.vim/templates/template.tex
autocmd BufNewFile *.java 0r /home/george/.vim/templates/template.java

autocmd BufNewFile,BufRead * :set textwidth=80
autocmd BufNewFile,BufRead * :set spell


autocmd BufRead *.lhs :set syntax=haskell

map <F3> :! latex "%"<CR>


map <F12> :split $MYVIMRC<CR>



