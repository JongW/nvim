" Specify a directory for plugins 

call plug#begin('~/.local/share/nvim/plugged')

" Themeing
Plug 'j-tom/vim-old-hope'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'ap/vim-css-color'
"Plug 'Yggdroot/indentLine'
"Plug 'gko/vim-coloresque'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Movement utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'

" Programming 
"Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tsanch3z/indent-python.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'shime/vim-livedown'
Plug 'turbio/bracey.vim'

" General utility
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" General vim utility
"Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/cmdalias.vim'

" Markdown
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
"Plug 'suan/vim-instant-markdown'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
