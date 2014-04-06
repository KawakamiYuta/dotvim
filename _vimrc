scriptencoding utf-8
"Last Change: 6-Mar-2014
"Maintainer: kawakami yuta
"-------------------------------------------------------------------------------

if has('vim_starting')
        set nocompatible
		set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


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
set hidden
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


"""ime setting
if has('multi byte ime') || has('xim') || has('gui_macvim')
		"Insert mode :lmap off , IME ON
		set iminsert=2
		"Serch mode  :lmap off , IME ON
		set imsearch=2
		inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

augroup highlightZenkakuSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight ZenkakuSpace 
                          \term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match ZenkakuSpace /Å@/
augroup END
highlight ColorColumn guibg=SlateBlue
colorscheme desert
