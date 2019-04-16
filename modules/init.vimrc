" Specify a directory for plugins 

call plug#begin('~/.local/share/nvim/plugged')

" Themeing
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Movement utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'

" Programming 
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tsanch3z/indent-python.vim'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'

" HTML
Plug 'turbio/bracey.vim'
Plug 'alvan/vim-closetag'

" General utility
Plug 'xolox/vim-session'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" General vim utility
Plug 'vim-scripts/cmdalias.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

Plug 'hecal3/vim-leader-guide'
call plug#end()

"Plug 'ap/vim-css-color'
"Plug 'Yggdroot/indentLine'
"Plug 'gko/vim-coloresque'
"Plug 'vim-syntastic/syntastic'
"Plug 'vimwiki/vimwiki'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
"Plug 'suan/vim-instant-markdown'
"Plug 'j-tom/vim-old-hope'
"Plug 'shime/vim-livedown'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"test3
