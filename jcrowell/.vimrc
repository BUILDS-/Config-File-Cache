set laststatus=2 "grey status bar on bottom
syn on "turn on syntax highlighting
filetype indent on "smart indents based on filetypes
set ai "auto indents
set nu "show line numbers
set ic "case insensitive searches
set smartcase "smart case searches, defaults to ic, if has caps, use it
set incsearch "incremental search
colorscheme solarized "colorscheme... I change this often
set tabstop=4 "tabs set to 4 spaces
set shiftwidth=4 "indents also 4 spaces
set shiftround "indent rount to next shiftwidth
set expandtab "change all new tabs to spaces
set backspace=indent,eol,start "smart-er backspaces
set guifont=consolas:h10:w6 "set the font for consolas, this only works with gvim
set ww=b,s,h,l,<,>,[,] "set (b)ackspace, (s)pace, and arrows to jump lines
set noeol "perf tests don't like this newline business 
set binary "again for perf stuff
"some color stuff
set background=dark
let g:solarized_contrast="medium"


