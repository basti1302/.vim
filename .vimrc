let $VIMHOME = $HOME."/.vim"

" let g:ruby_path = ':C:\ruby193\bin'

" load bundles managed by pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible

filetype plugin indent on

" colors and fonts
colorscheme desert
set guifont=DejaVu_Sans_Mono:h12:cANSI
set modelines=0

" start with larger window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=40 columns=110
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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
set relativenumber
set undofile
set hlsearch

" save automatically
au FocusLost * :wa

" == KEY MAPPGINGS ==
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


" NERDTree
" to start NERDTree only if started without file argument
" autocmd vimenter * if !argc() | NERDTree | endif
" to start NERDTree always on startup:
" autocmd vimenter * NERDTree
