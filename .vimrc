" Re-execute: :so $MYVIMRC
" or, if vimrc is the current file:
" :so %

" load bundles managed by pathogen
call pathogen#infect()
call pathogen#helptags()

set nocompatible

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" see http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set noesckeys

syntax on
filetype plugin indent on

" colors and fonts
if has("win32")
  set guifont=Lucida_Console:h11:cANSI
else
  set guifont=DejaVu_Sans_Mono:h12:cANSI
endif

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
" set textwidth=80

" visualize 80 character boundary
if v:version >= 703
  set colorcolumn=81
endif

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
set ff=unix
" case insensitive search by default, use /\CFooBar to search case sensitive
" set ignorecase

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

" == COMMANDS ==
command! W w
command! WA wa
command! Wa wa
command! WQ wq
command! Wq wq
command! Q q
command! Qa qa
command! QA qa
" save changes to a file the needs sudo permissions even when opened without sudo
cmap w!! w !sudo tee > /dev/null %

"command remove-dos-line-endings %s/\r//g

" == KEY MAPPINGS ==
let mapleader = " "
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
" use visual selection for search and replace: press CTRL-r in visual mode
vnoremap <c-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <s-r> "hy:%s//<C-r>h/gc<Home><right><right><right>
" Open explorer mode/netrw on SPACE,k
map <leader>k :Explore<cr>
" disable Escape, Caps Lock must be mapped to Esc on OS level
"map <ESC> <Nop>
"map! <ESC> <Nop>

" use tree style for netrw
let g:netrw_liststyle=3

" open files in right split when using vsplit or when using v in netrw listing
set splitright

" automatically reload .vimrc if it has changed
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" vimdiff with the default colors in solarized dark is totally unusable
if &diff
  colorscheme shine
  highlight! link DiffText Todo
endif

" ******************************************************************************
" PLUGIN SPECIFIC SETTINGS
" ******************************************************************************

" == ctrlp ==
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" ignore node_modules and other irrelevant directories
let g:ctrlp_custom_ignore = 'node_modules\|elm-stuff\|DS_Store\|git'
" default: let g:ctrlp_working_path_mode = 'ra'
" c -> Use parent of current open file as base directory every time CtrlP is
"      invoked
" a -> Use parent of current open file as base directory every time CtrlP,
"      unless vim's cwd is an ancestor of the current open file
" r -> Look for nearest .git etc.
"      unless vim's cwd is an ancestor of the current open file
let g:ctrlp_working_path_mode = 'a'

" == ELM ==
let g:elm_format_autosave = 1

" == GO ==
autocmd FileType go compiler go

" == NERDTree ==
" Ctrl-P -> Open NERDTree
map <C-n> :NERDTreeToggle<CR>
" to start NERDTree only if started without file argument
" autocmd vimenter * if !argc() | NERDTree | endif
" to start NERDTree always on startup:
" autocmd vimenter * NERDTree
" close vim if only NERDTree buffers remain
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
