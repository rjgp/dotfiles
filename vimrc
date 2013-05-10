execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set novisualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set undodir=~/.vim/.undo

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list listchars=tab:▸\
set list listchars=trail:-

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

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>a :Ack

nnoremap <leader>q gqip

nnoremap <leader>v V`]

inoremap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has("gui_running")
  set background=light
  colorscheme solarized
  set guioptions-=r  " no scrollbar on the right
  set guioptions-=l  " no scrollbar on the left
  "set guioptions-=m  " no menu
  set guioptions-=T  " no toolbar
  set guifont=Bitstream
else
  set t_Co=256
  let g:solarized_termcolors=256
  set background=light
  colorscheme solarized
endif

set mouse=a

:noremap <Leader>t :tabnew .<cr>
:noremap <Leader>v :vsp .<cr>
:noremap <Leader>h :split .<cr>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
"" Move current window to previous tab
function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunction

" Move current window to next tab
function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunction

nnoremap <Leader>n :call MoveToNextTab()<CR>
nnoremap <Leader>N :call MoveToNextTab()<CR><C-w>H
nnoremap <Leader>p :call MoveToPrevTab()<CR>
nnoremap <Leader>P :call MoveToPrevTab()<CR><C-w>H
