""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                      "Default vim keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" Map space as the leader key
let mapleader = " "

" attempt at trying to fix copy paste
noremap d "_d
noremap dd "_dd
noremap c "_c
noremap cc "_cc

" auto center search result
nnoremap n nzz
nnoremap N Nzz

" Map JJ to Escape while in Insertion Mode
imap jj <Esc>

" Use arrow keys to move page (move like web browser)
nnoremap <Down> <c-e>
nnoremap <Up> <c-y>

" Quick save
map <Leader>w :update<CR>
map <Leader>qq :q!<CR>
map <Leader>s :wq<CR>
map <Leader>d :bd<CR>

" Quick Brackets
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

inoremap "<TAB> ""<C-c>i
inoremap '<TAB> ''<C-c>i
inoremap {<TAB> {}<C-c>i
inoremap [<TAB> []<C-c>i
inoremap (<TAB> ()<C-c>i

" set :noh
nnoremap <Leader>/ :nohlsearch<cr>

" Map o and O to just be used as inserting new line instead of new line & i
nnoremap o o<Esc>
nnoremap O O<Esc>

" use H and L to go end and beginnig of line
map H ^
map L $

"" Some weird solution i found to get rid of deletnig into register
"noremap p "0p
"noremap P "0P

"for s:i in ['"','*','+','-','.',':','%','/','=','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    "execute 'noremap "'.s:i.'p "'.s:i.'p'
    "execute 'noremap "'.s:i.'P "'.s:i.'P'
"endfor

"Use control HJKL to move around vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Saving files that require sudo access
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Toggle all folds
nnoremap <expr> zA &foldlevel ? 'zM' :'zR'

" Get rid of ctrl-p default keybind
let g:ctrlp_map = ''
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                      "Plugin Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
" Toggle nerd tree
map <C-e> :NERDTreeToggle<CR>

let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>y <Plug>(easymotion-bd-jk)
nmap <Leader>y <Plug>(easymotion-overwin-line)

" Clever F
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" Markdown preview
map <silent> <F8> <Plug>MarkdownPreview

nnoremap <Leader>x *``cgn
nnoremap <Leader>X #``cgN
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                      "Leader guide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:lmap = {}

" First level leader bindings
nmap <Leader>t <Plug>(Prettier)
let g:lmap.t = ['Prettier', 'Format code']
nnoremap <leader>cd :cd %:p:h<CR>
let g:lmap.cd = ['cd %:p:h', 'cd file directory']

" 2nd level leader bindings
let g:lmap.g = {
  \'name' : 'Git Menu',
  \'s' : ['Gstatus', 'Git Status'],
  \'p' : ['Gpull',   'Git Pull'],
  \'u' : ['Gpush',   'Git Push'],
  \'c' : ['Gcommit', 'Git Commit'],
  \'a' : ['Gcommit -a', 'Git commit ALL'],
  \'w' : ['Gwrite',  'Git Write'],
\}

let g:lmap.z = {
  \'name' : 'Extra Commmands',
  \'b' : ['Bracey', 'Start server'],
  \'r' : ['BraceyReload', 'Reload server'],
  \'s' : ['SaveSession', 'Save sesison'],
  \'o' : ['OpenSession', 'Open session']
\}

call leaderGuide#register_prefix_descriptions(",","g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
