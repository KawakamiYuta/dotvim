scriptencoding utf-8
" vim: set foldmethod=marker :
"Last Change: 10-Oct-2014.
"Maintainer:  kawakami yuta 
"-------------------------------------------------------------------------------

if has('vim_starting')
        set nocompatible
		set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set omnifunc=syntaxcomplete
set tags=./tags
set path+=/home/kawakami/ebara/src/sys/
syntax on

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
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'kana/vim-surround'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vimplugin/project.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Shougo/VimFiler'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'thinca/vim-ref'
NeoBundle 'sjl/gundo.vim.git'
"NeoBundle 'jceb/vim-orgmode'
NeoBundle 'hsitz/VimOrganizer'
NeoBundle 'osyo-manga/vim-stargate'
"NeoBundle 'fuenor/im_control.vim '
filetype plugin indent on
NeoBundleCheck
"""}}}

"""Encoding"{{{
set encoding=utf-8
set fileencodings=utf-8,cs-bom,iso-2022-jp-3,iso-2022-jp,
                 \eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac
"}}}

"""Search"{{{
set ignorecase
set hlsearch
set smartcase
"}}}

"""Edit"{{{
set backspace=indent,eol,start
set modeline
set showmatch
set virtualedit=block
set foldenable
set foldmethod=marker
set foldcolumn=3
if exists('FoldCCtext')
	set foldtext=FoldCCtext()
endif
set undodir=~/.vim/undodir
set undofile
set smarttab
set tabstop=4
"set expandtab
set shiftround
set matchpairs+=<:>
set smartindent
set textwidth=80
set nobackup
set clipboard=unnamed
set shiftwidth=4
set noswapfile
"set hidden
"}}}

"""View"{{{
set cursorline
set number
"set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
"set colorcolumn=+1
"set spell
set laststatus=2
set cmdheight=2
set linebreak
set wildmenu
set t_Co=256
set showbreak=\
set breakat=\ \ ;:,!?
"}}}

"""Lang"{{{
set helplang=en,ja
set formatoptions+=mM
"}}}

"""Gui"{{{
set guioptions-=m
set guioptions-=T
"}}}

"""IME"{{{
if has('win16')|| has('win32') || has('win64')
	if has('multi byte ime') || has('xim') || has('gui_macvim')
		"Insert mode :lmap off , IME ON
		set iminsert=2
		"Serch mode  :lmap off , IME ON
		set imsearch=2
		inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
	endif
endif
"}}}

"""Keymapping"{{{
let mapleader=","
nnoremap , ¥
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
nnoremap <Leader>c :<C-u>set cursorline!<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>
nnoremap <Leader>4 :<C-u>set tabstop=4<CR>
nnoremap <Leader>8 :<C-u>set tabstop=8<CR>
nnoremap <Leader>e :<C-u>set expandtab!<CR>
nnoremap <Leader>l :<C-u>set list!<CR>
nnoremap <Leader>cce :<C-u>set colorcolumn=""<CR>
nnoremap <Leader>ccd :<C-u>set colorcolumn=+1<CR>
"nnoremap <Leader>f :<C-u>Explore<CR>
nnoremap <Leader>f :<C-u>set foldmethod=indent<CR>
nnoremap <Leader>ff:<C-u>set foldmethod=syntax<CR>
nnoremap <Leader>s :<C-u>spell!<CR>
nnoremap <Leader>h :<C-u>hidden!<CR>
nnoremap <Leader>o :<C-u>Unite outline<CR>
"nnoremap <Leader>m :<C-u>make depend<CR>
nnoremap <Leader>\ :<C-u>checkpath<CR>
nnoremap <Leader>x :<C-u>set syntax=c<CR>
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>
map	 <C-]>	   :<C-u>GtagsCursor<CR>
map	 <Leader>o :<C-u>Gtags -f %<CR>
map	 <Leader>g :<C-u>Gtags<CR>
map	 <Leader>r :<C-u>Gtags -r<CR>
nmap <C-n> :<C-u>cn<CR>
nmap <C-p> :<C-u>cp<CR>
map  <C-c>	   :<C-u>qa!<CR>
map  <Leader>w :<C-u>wq<CR>
map  <Leader>q :<C-u>q!<CR>
vmap <Leader>b v`<I<CR><esc>k0i#if 0<ESC>`>j0i#endif<CR><esc><ESC>
nmap <Leader>m :<C-u>make -C ../../compile/i386-s<CR>
"nmap <C-m>d :<C-u>make depend -C ../../compile/i386-s<CR>
nmap <Leader>a :<C-u>Align =<CR>
"}}}

"""plugins{{{
"""vimfiler"{{{
let g:vimfiler_as_default_explorer=1
"}}}
"""neocomplcache.vim{{{
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"}}}
""""neocomplete.vim{{{
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
""" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"     ¥ 'default' : '',
"     ¥ 'vimshell' : $HOME.'/.vimshell_hist',
"     ¥ 'scheme' : $HOME.'/.gosh_completions'
"	     ¥ }
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"		return neocomplete#close_popup() . "¥<CR>"
"		" For no inserting <CR> key.
"		"return pumvisible() ? neocomplete#close_popup() : "¥<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "¥<C-n>" : "¥<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."¥<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."¥<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
""¥<Space>"
"
"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplete#close_popup() . "¥<Left>"
""inoremap <expr><Right> neocomplete#close_popup() . "¥<Right>"
""inoremap <expr><Up>    neocomplete#close_popup() . "¥<Up>"
""inoremap <expr><Down>  neocomplete#close_popup() . "¥<Down>"
"" Or set this.
""let g:neocomplete#enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplete#enable_insert_char_pre = 1
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "¥<Down>" : "¥<C-x>¥<C-u>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"		let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^.  ¥t]->¥h¥w*¥|¥h¥w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *¥t]¥%(¥.¥|->¥)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *¥t]¥%(¥.¥|->¥)¥|¥h¥w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '¥h¥w*->¥h¥w*¥|¥h¥w*::'
"
""""}}}
"""eskk.vim{{{
"let g:eskk#directory = "~/.eskk"
"let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
"let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
""""}}}
"""neosnippet{{{
imap <C-k>	<Plug>(neosnippet_expand_or_jump)
smap <C-k>	<Plug>(neosnippet_expand_or_jump)
xmap <C-k>	<Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" ¥ "¥<Plug>(neosnippet_expand_or_jump)"
" ¥: pumvisible() ? "¥<C-n>" : "¥<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" ¥ "¥<Plug>(neosnippet_expand_or_jump)"
" ¥: "¥<TAB>"

if has('conceal')
		set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibility=1

let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

"""}}}
"""memolist"{{{
map <Leader>mn :<C-u>MemoNew<CR>
map <Leader>ml :<C-u>MemoList<CR>
map <Leader>mg :<C-u>MemoGrep<CR>

let g:memolist_path="/home/kawakami/memo"
let g:memolist_prompt_tags=1
"let g:memolist_prompt_categories=1
let g:memolist_memo_suffix="markdown"
let g:memolist_unite=1
let g:memolist_unite_option="-winheight=20"
let g:memolist_unite_source="file_rec"
"let g:memolist_vimfiler=1
"let g:memolist_vimfiler_option="-split -winwindth=20"

"}}}
"""autodate"{{{
let g:autodate_keyword_pre = "updated:"
let g:autodate_format = "%Y-%m-%d"
let g:autodate_keyword_post = "."
"}}}
"""solarized"{{{
"let g:solarized_contrast"low"
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
"}}}
"""}}}

set background=dark
colorscheme molokai
highlight ColorColumn ctermbg=2
"highlight ColorColumn guibg=DarkRed ctermbg=Cyan

"""Function"{{{
augroup highlightZenkakuSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight ZenkakuSpace 
                          \term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match ZenkakuSpace /?@/
augroup END
"}}}
