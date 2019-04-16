" Lightline settings 

" Powerline font for light line
let s:powerline_font              = 1 " Enable for powerline glyphs
if s:powerline_font
  let s:symbol_separator_left     = "\uE0B0"
  let s:symbol_separator_right    = "\uE0B2"
  let s:symbol_subseparator_left  = "\uE0B1"
  let s:symbol_subseparator_right = "\uE0B3"
  let s:symbol_vcs_branch         = "\uE0A0"
else
  let s:symbol_separator_left     = "▏"
  let s:symbol_separator_right    = "▕"
  let s:symbol_subseparator_left  = "│"
  let s:symbol_subseparator_right = "│"
  let s:symbol_vcs_branch         = "\u16B4"
endif

let g:lightline = {
	      \ 'active': {
	      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'], ['ctrlpmark'] ],
	      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], ['filetype' ] ]
	      \ },
	      \ 'component_function': {
	      \   'fugitive': 'LightlineFugitive',
	      \   'filename': 'LightlineFilename',
	      \   'fileformat': 'LightlineFileformat',
	      \   'filetype': 'LightlineFiletype',
	      \   'fileencoding': 'LightlineFileencoding',
	      \   'mode': 'LightlineMode',
	      \   'ctrlpmark': 'CtrlPMark',
        \   'cocstatus' : 'coc#status'
	      \ },
	      \ 'component_expand': {
	      \   'syntastic': 'SyntasticStatuslineFlag',
        \   'buffers': 'lightline#bufferline#buffers'
	      \ },
	      \ 'component_type': {
	      \   'syntastic': 'error',
        \   'buffers': 'tabsel'
	      \ },
	      \ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline.colorscheme = "gruvbox"
let g:lightline.tab              = {'active': ['tabnum'], 'inactive': ['tabnum']}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['cocstatus']]}

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_separator = ''
let g:lightline#bufferline#show_number = 2

let g:lightline.separator        = {'left': s:symbol_separator_left, 'right': s:symbol_separator_right}
let g:lightline.subseparator     = {'left': s:symbol_subseparator_left, 'right': s:symbol_subseparator_right}

	function! LightlineModified()
	  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
	  return &ft !~? 'help' && &readonly ? 'RO' : ''
	endfunction

" Change the filename depending on mode
" eg. if on nerd tree get rid of file name 
	function! LightlineFilename()
	  let fname = expand('%:t')
	  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	        \ fname == '__Tagbar__' ? g:lightline.fname :
	        \ fname =~ '__Gundo\|NERD_tree' ? '' :
	        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
	        \ &ft == 'unite' ? unite#get_status_string() :
	        \ &ft == 'vimshell' ? vimshell#get_status_string() :
	        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
	        \ ('' != fname ? fname : '[No Name]') .
	        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
	endfunction

	function! LightlineFugitive()
	  try
	    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
	      let mark = ''  " edit here for cool mark
	      let branch = fugitive#head()
	      return branch !=# '' ? mark.branch : ''
	    endif
	  catch
	  endtry
	  return ''
	endfunction

" Remove if window is too small
	function! LightlineFileformat()
	  return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightlineFiletype()
	  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction

	function! LightlineFileencoding()
	  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
	endfunction

" This is what changes the modes
	function! LightlineMode()
	  let fname = expand('%:t')
	  return fname == '__Tagbar__' ? 'Tagbar' :
	        \ fname == 'ControlP' ? 'CtrlP' :
          \ fname == '__Gundo__' ? 'Gundo' :
	        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
	        \ fname =~ 'NERD_tree' ? 'NERDTree' :
	        \ &ft == 'unite' ? 'Unite' :
	        \ &ft == 'vimfiler' ? 'VimFiler' :
	        \ &ft == 'vimshell' ? 'VimShell' :
	        \ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

" the thingy that is next to the ctrl p displaying random names
	function! CtrlPMark()
	  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
	    call lightline#link('iR'[g:lightline.ctrlp_regex])
	    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
	          \ , g:lightline.ctrlp_next], 0)
	  else
	    return ''
	  endif
	endfunction

	let g:ctrlp_status_func = {
	  \ 'main': 'CtrlPStatusFunc_1',
	  \ 'prog': 'CtrlPStatusFunc_2',
	  \ }

	function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	  let g:lightline.ctrlp_regex = a:regex
	  let g:lightline.ctrlp_prev = a:prev
	  let g:lightline.ctrlp_item = a:item
	  let g:lightline.ctrlp_next = a:next
	  return lightline#statusline(0)
	endfunction

	function! CtrlPStatusFunc_2(str)
	  return lightline#statusline(0)
	endfunction

	let g:tagbar_status_func = 'TagbarStatusFunc'

	function! TagbarStatusFunc(current, sort, fname, ...) abort
	    let g:lightline.fname = a:fname
	  return lightline#statusline(0)
	endfunction

	" Syntastic can call a post-check hook, let's update lightline there
	" For more information: :help syntastic-loclist-callback
	function! SyntasticCheckHook(errors)
	  call lightline#update()
	endfunction

	let g:unite_force_overwrite_statusline = 0
	let g:vimfiler_force_overwrite_statusline = 0
	let g:vimshell_force_overwrite_statusline = 0


autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
