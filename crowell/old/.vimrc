call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
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
"some color stuff
set background=dark
let g:solarized_contrast="high"
let g:solarized_termcolors=256
set t_Co=256 
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
let g:SuperTabDefaultCompletionType = "context"
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
noremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode

