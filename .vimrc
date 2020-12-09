filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable

if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') 
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end() 

set number
set cmdheight=1
set hlsearch

set noerrorbells
set novisualbell

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set softtabstop=4
set autoindent

vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>

colorscheme sublimemonokai

