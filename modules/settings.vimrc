" Vim settings 
set termguicolors

" Set relative numbers
set nonu
set rnu

" Decrease margin size
set nuw=3

" Enable marker folding
 set foldmethod=marker 

" For markdown plugins
filetype plugin on

" Always copy and paste to system clipboard instead of vim registers
"set clipboard=unnamedplus

" Show the tab at the top
set showtabline=2

" turnoff markdown hiding
set conceallevel=0

"Enable mouse usage(all modes)
set mouse=a     

" Set compatibility to Vim only.
set nocompatible

" Automatically wrap text that extends beyond the screen length.
set wrap

" Encoding
set encoding=utf-8

 "Highlight matching search patterns
set hlsearch
 "Enable incremental search
set incsearch

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Turn off modelines
set modelines=0

" Indentation settings
"set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Formatting settings
set formatoptions-=cro

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast
set lazyredraw
    
" Status bar
set laststatus=2

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Buffer line plug in
set hidden
set noshowmode 

let g:mkdp_browser = 'qutebrowser'
let g:session_autosave = 'no'
let g:session_autoload = 'no'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
