scriptencoding utf-8
"Last Change: 18-Apr-2014.
"Maintainer:  kawakami yuta 
"-------------------------------------------------------------------------------

if has('vim_starting')
        set nocompatible
		set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"""neobundle.vim{{{
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"""vimproc{{{
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"""}}}
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neo
NeoBundle 'kana/vim-surround'
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'tyru/eskk.vim'
"NeoBundle 'fuenor/im_control.vim '
filetype plugin indent on
NeoBundleCheck
"""}}}

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,
                 \eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac """
set backspace=indent,eol,start
set cursorline
"set cursorcolumn
set number
"set tabstop=8
set tabstop=4
"set expandtab """expand tab to space
set ignorecase
set smartcase
set hlsearch
set helplang=en,ja
set textwidth=80
set formatoptions+=mM
"set colorcolumn=+1
set noswapfile
set wildmenu
set nobackup
"set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set foldenable
set foldmethod=marker
set foldcolumn=3
set clipboard=unnamed
set guioptions-=m
set guioptions-=T
"set hidden
syntax on
if exists('FoldCCtext')
        set foldtext=FoldCCtext() """change fold-function
endif

nnoremap <Space>.
        \       :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s.
        \       :<C-u>source $MYVIMRC<CR>
"""<Leader>=',' XXX may be have problem
""" XXX why can't?
"nnoremap \ ,
"nnoremap , \
nnoremap <Leader>c :<C-u>set cursorline!<CR>
nnoremap <Leader>v :<C-u>set cursorcolumn!<CR>
nnoremap <Leader>4 :<C-u>set tabstop=4<CR>
nnoremap <Leader>8 :<C-u>set tabstop=8<CR>
nnoremap <Leader>e :<C-u>set expandtab!<CR>
nnoremap <Leader>l :<C-u>set list!<CR>
nnoremap <Leader>cce :<C-u>set colorcolumn=""<CR>
nnoremap <Leader>ccd :<C-u>set colorcolumn=+1<CR>
nnoremap <Leader>f :<C-u>Explore<CR>
nnoremap <Leader>s :<C-u>spell!<CR>
nnoremap <Leader>h :<C-u>hidden!<CR>

"°÷∆¸À‹∏Ï∆˛Œœ∏«ƒÍ•‚°º•…°◊§Œvi∂®ƒ¥•‚°º•…§ÚÃµ∏˙≤Ω
let IM_vi_CooperativeMode = 0
" ¡ﬁ∆˛•‚°º•…Ω™Œªª˛§ÀIMEæı¬÷§Ú ›¬∏§∑§ §§
inoremap <silent> <ESC> <ESC>:call IMCtrl('Off')<CR>
inoremap <silent> <C-[> <ESC>:call IMCtrl('Off')<CR>

" <ESC>≤°≤º∏Â§ŒIM¿⁄¬ÿ≥´ªœ§ﬁ§«§Œ»ø±˛§¨√Ÿ§§æÏπÁ§œttimeoutlen§Ú√ª§Ø¿ﬂƒÍ§∑§∆§ﬂ§∆§Ø§¿§µ§§(•ﬂ•Í…√)
set timeout timeoutlen=3000 ttimeoutlen=100



"""ime setting
if has('multi byte ime') || has('xim') || has('gui_macvim')
		"Insert mode :lmap off , IME ON
		set iminsert=2
		"Serch mode  :lmap off , IME ON
		set imsearch=2
		inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"""plugins{{{
"""neocomplete.vim{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme' : $HOME.'/.gosh_completions'
	     \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
		return neocomplete#close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
"\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""}}}
"""eskk.vim{{{
let g:eskk#directory = "~/.eskk"
let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
"""}}}
"""}}}
augroup highlightZenkakuSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight ZenkakuSpace 
                          \term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match ZenkakuSpace /Å@/
augroup END
highlight ColorColumn guibg=SlateBlue
colorscheme morning
