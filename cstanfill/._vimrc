" vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'majutsushi/tagbar'
Bundle 'mantiz/vim-plugin-dirsettings'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/a.vim'
Bundle 'argtextobj.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tComment'
Bundle 'def-lkb/vimbufsync'
" only uncomment if it's worth it
" Bundle 'the-lambda-church/coquille'
Bundle 'jceb/vim-orgmode'
" only uncomment if +clientserver
Bundle 'pydave/AsyncCommand'
Bundle 'altercation/vim-colors-solarized'
Bundle 'dahu/Nexus'
Bundle 'dahu/vim-KWEasy'
Bundle 'bitc/vim-hdevtools'
Bundle 'lukerandall/haskellmode-vim'
call dirsettings#Install()
filetype plugin on
filetype indent on
syntax on
" end vundle nonsense

set expandtab     "use spaces
set modeline      "show modeline
set showcmd       "show command as it is typed
set cindent       "use c-style auto-indentation
set ignorecase    "case insensitive searching
set hidden        "hide buffers instead of closing when you open a new one
set backspace=2   "fix some backspace nonsense
set wildmode=longest,list,full
set wildmenu      "this + previous gives more bash-like completion
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
let g:haddock_browser="/usr/local/bin/elinks"

"remap jk to escape for 3xtr4 l33t h4xx|ng
inoremap jk <Esc>

"more hjkl!!!
noremap <C-h> <Esc>:bp<Cr>
noremap <C-l> <Esc>:bn<Cr>
noremap <C-j> <C-e>
noremap <C-k> <C-y>
noremap <F5> <Esc>:make<CR>
noremap <F6> <Esc>:make clean<CR>

inoremap <F2> <Esc>:bp<CR>
inoremap <F3> <Esc>:bn<CR>
inoremap <F4> <Esc>:bd<CR>
inoremap <F5> <Esc>:make<CR>
inoremap <F6> <Esc>:make clean<CR>
" whitespace management
function! ShowSpaces(...)
  let @/='\s\+$'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
nnoremap <C-s>w     :ShowSpaces 1<CR>

vmap gw :s/\s\+$<CR>
nmap gw :s/\s\+$<CR>

" set my status line to be all fancy :o
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

" column/line/size/percentage
set statusline+=%=
set statusline+=%c\
set statusline+=%l/%L
set statusline+=\ %P

" always show statusline
set laststatus=2
hi StatusLine ctermfg=4
" end stausline nonsense

" load plugins and set plugin options
set runtimepath+=$HOME/.vim/
let g:miniBufExplForceSyntaxEnable = 1
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimIvyClasspathUpdate = 0

" lets C-s and C-q be capture by vim instead of the terminal
silent !stty -ixon > /dev/null 2>/dev/null

" C-s is where I put most of my custom rare-use things.
" b opens the ctags navigator
" n/N open and close nerdtree TODO: bind both to n
" c generates ctags and puts them in the git subdir
" h toggles whether searches highlight things
" b, r, c, and t are reserved for build, run, compile, and test
" l is a prefix for language-specific things
" g is a prefix for git
" k kills the current buffer / window
nmap <C-s>v :TagbarToggle<CR>
nmap <C-s>n :NERDTreeToggle<CR>
nmap <C-s>s :set number!<CR> 
nmap <C-s>o :!ctags --tag-relative -Rf.git/tags<CR><CR>
nmap <C-s>h :set hlsearch!<CR>
nmap <C-s>gc :Gcommit<CR>
nmap <C-s>ga :Git add -p<CR>
nmap <C-s>gb :Gblame<CR>
nmap <C-s>gs :Gstatus<CR>
nmap <C-s>k :bd<CR>
nmap <C-s>vs :so $MYVIMRC<CR>
nmap <C-s>q <Plug>KweasyJump
nmap <C-s>ve :e $MYVIMRC<CR>

" indentation = 4 spaces, no tabs
set ts=4
set sw=4

" filetype commands
" TeX: commands for evince and pdflatex; indent 1 at a time
" golang: not sure, should maybe remove it
" text files: stop autoindenting
function! AsyncCmd(cmd) 
    " call our core function to run in the background and then load the 
    " output file on completion 
    call asynccommand#run(a:cmd, asynchandler#split()) 
endfunction
" leaving this here ... it might be useful later
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

augroup ft_tex
    autocmd! 
    autocmd FileType tex noremap <C-s>c :!pdflatex %<CR><CR>
    autocmd FileType tex noremap <C-s>r :silent !evince %<.pdf >/dev/null 2>&1 &<CR><CR>
    autocmd FileType tex set ts=1
    autocmd FileType tex set sw=1
augroup END

augroup ft_go
    autocmd!
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd FileType go compiler go
augroup END

augroup ft_txt
    autocmd!
    autocmd BufRead *.txt set noautoindent nocindent
augroup END

augroup ft_java
    autocmd!
    autocmd FileType java noremap <C-s>lc :JavaCorrect<CR>
    autocmd FileType java noremap <C-s>li :JavaImport<CR>
    autocmd FileType java noremap <C-s>lr :JavaRename 
    autocmd FileType java noremap <C-s>lo :JavaImpl<CR>
    autocmd FileType java noremap <C-s>b :call AsyncCmd("ANT_OPTS='-Ddefault.resolver=local-resolver -Doffline=true' ant build")<CR>
    autocmd FileType java noremap <C-s>c :call AsyncCmd("ant clean")<CR>
    autocmd FileType java noremap <C-s>t :call AsyncCmd("ANT_OPTS='-Ddefault.resolver=local-resolver -Doffline=true' ant test " . "<bar>" ." grep \"\\\[junit\\\]\"")<CR>
    autocmd FileType java setlocal foldmethod=syntax
    autocmd FileType java setlocal foldlevel=100
augroup END

augroup ft_coq
    autocmd FileType coq noremap <C-s>ln :CoqNext<CR>
    autocmd FileType coq noremap <C-s>lc :CoqToCursor<CR>
    autocmd FileType coq noremap <C-s>lu :CoqUndo<CR>
    autocmd FileType coq noremap <C-s>ll :CoqLaunch<CR>
    autocmd FileType coq noremap <C-s>lk :CoqKill<CR>
augroup END

augroup ft_hask
    autocmd!
    autocmd BufRead,BufNewFile *.hs setfiletype haskell
    " autocmd FileType haskell noremap <C-s>b :call AsyncCmd("cabal build")<CR>
    autocmd FileType haskell noremap <C-s>b :!cabal build<CR>
    autocmd FileType haskell nnoremap <buffer> <C-s>lt :HdevtoolsType<CR>
    autocmd FileType haskell nnoremap <buffer> <silent> <C-s>lc :HdevtoolsClear<CR>
    autocmd FileType haskell nnoremap <buffer> <silent> <C-s>li :HdevtoolsInfo<CR>
    autocmd FileType haskell compiler ghc
augroup END
" retain session info; have off to avoid stupid caching problems (for now)
" autocmd BufWrite * mkview
" autocmd BufRead * silent loadview
