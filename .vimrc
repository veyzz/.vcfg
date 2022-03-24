filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable
set ttimeoutlen=10

if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') 
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
call plug#end() 

" toggle relative and absolute line numbers
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set cmdheight=1

set noerrorbells
set novisualbell

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set softtabstop=2
set autoindent

" swap C-j and C-m
imap <C-j> <CR>
imap <C-m> <NL>

colorscheme sublimemonokai

