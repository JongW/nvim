" Theme settings 

" Vim colorscheme settings
set background=dark
"color old-hope
set syntax=on
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark ="medium"
colorscheme gruvbox

" Make insert mode more obvious
autocmd InsertEnter,InsertLeave * set cul!

" Change cursor when on different editing modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
