" vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'majutsushi/tagbar'
Bundle 'mantiz/vim-plugin-dirsettings'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
" Not sure how I feel about YCM ...
" Fuck, this takes actual work to set up, eff it all
" Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/a.vim'
Bundle 'argtextobj.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tComment'
Bundle 'def-lkb/vimbufsync'
Bundle 'the-lambda-church/coquille'
Bundle 'jceb/vim-orgmode'

call dirsettings#Install()
filetype plugin on
filetype indent on
syntax on

set expandtab     "use spaces
set modeline      "show modeline
set showcmd       "show command as it is typed
set cindent       "use c-style auto-indentation
set ignorecase    "case insensitive searching

"remap jk to escape for 3xtr4 l33t h4xx|ng
inoremap jk <Esc>

"F2 = previous buffer, F3 = next, F4 = close buffer
"F5 = make, F6 = make clean
noremap <F2> <Esc>:bp<CR>
noremap <F3> <Esc>:bn<CR>
noremap <F4> <Esc>:bd<CR>
"more hjkl!!!
noremap <C-h> <Esc>:bp<Cr>
noremap <C-l> <Esc>:bn<Cr>
noremap <F5> <Esc>:make<CR>
noremap <F6> <Esc>:make clean<CR>
inoremap <F2> <Esc>:bp<CR>
inoremap <F3> <Esc>:bn<CR>
inoremap <F4> <Esc>:bd<CR>
inoremap <F5> <Esc>:make<CR>
inoremap <F6> <Esc>:make clean<CR>
" whitespace management
function ShowSpaces(...)
  let @/='\s\+$'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
nnoremap <C-s>w     :ShowSpaces 1<CR>

vmap gw :s/\s\+$<CR>
nmap gw :s/\s\+$<CR>

" MORE HJKL!!!!!!!!!
nmap <C-j> <C-e>
nmap <C-k> <C-y>

" filename
set statusline =%#identifier#
set statusline+=[%t]

" line ending warning
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}

" filetype
set statusline+=%#identifier#
set statusline+=%y

" modified flag
set statusline+=%m

" git branch
set statusline+=%{fugitive#statusline()}

set statusline+=%=
set statusline+=%c\
set statusline+=%l/%L
set statusline+=\ %P

set laststatus=2
hi StatusLine ctermfg=4

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

nmap <C-c>n :CoqNext<CR>
nmap <C-c>c :CoqToCursor<CR>
nmap <C-c>u :CoqUndo<CR>
nmap <C-c>l :CoqLaunch<CR>
nmap <C-c>k :CoqKill<CR>

set ts=4
set sw=4

autocmd FileType tex noremap <F5> <Esc>:!pdflatex %<Cr><Cr>
autocmd FileType tex noremap <F6> <Esc>:silent !evince %<.pdf >/dev/null 2>&1 &<Cr><Cr>
autocmd FileType tex set ts=1
autocmd FileType tex set sw=1
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go


