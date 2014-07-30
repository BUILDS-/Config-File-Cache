set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set laststatus=2 "grey status bar on bottom
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set smartcase "smart case searches, defaults to ic, if has caps, use it
set incsearch "incremental search
set tabstop=2 "tabs set to 4 spaces
set shiftwidth=2 "indents also 4 spaces
set shiftround "indent rount to next shiftwidth
set expandtab "change all new tabs to spaces
set backspace=indent,eol,start "smart-er backspaces
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
"some color stuff
let g:solarized_contrast="high"
let g:solarized_termcolors=256
set background=dark " dark | light "
set t_Co=256
let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set showmode
filetype plugin on
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
set cc=80

map <C-K> :pyf /home/jeff/clang-format.py<CR>
imap <C-K> <ESC>:pyf /home/jeff/clang-format.py<CR>i
