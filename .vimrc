" Re-execute: :so $MYVIMRC
" or, if vimrc is the current file:
" :so %

" load bundles managed by pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible

filetype plugin indent on

" colors and fonts
colorscheme harlequin
set guifont=DejaVu_Sans_Mono:h12:cANSI
set modelines=0

" start with larger window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=40 columns=110
endif

" indent two spaces
set shiftwidth=2

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" word wrap at column 80
set textwidth=80

" visualize 80 character boundary
set colorcolumn=+1

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set hlsearch

" Highlight matching parantheses in a sane style. Todo: Replace by rainbow
" parantheses plug-in
hi MatchParen cterm=bold ctermbg=none ctermfg=none

set number

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+\%#\@<!$/
" automatically remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" automatically save when losing focus
" au FocusLost * :wa

" == KEY MAPPINGS ==
let mapleader = ","
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <leader>home :cd $home/Documents/_home_/


" NERDTree
" to start NERDTree only if started without file argument
" autocmd vimenter * if !argc() | NERDTree | endif
" to start NERDTree always on startup:
" autocmd vimenter * NERDTree
