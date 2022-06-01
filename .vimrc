filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable
set ttimeoutlen=10

" plugins
if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') 
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
call plug#end() 

" toggle relative and absolute line numbers
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" .h is c-file, not cpp
augroup cfiletype
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
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

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions/" . expand('%:p:h')
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/' . expand('%:t') . '.vim'
  exe "mksession! " . b:filename
  call RemoveOldSessions()
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions/" . expand('%:p:h')
  let b:sessionfile = b:sessiondir . '/' . expand('%:t') . '.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

function! RemoveOldSessions()
  let b:sessiondir = $HOME . "/.vim/sessions/"
  let b:notuseddays = 16
  silent exe '!find ' . b:sessiondir ' -type f -name "*.vim" -mtime "+' . b:notuseddays . '" -delete'
  silent exe '!find ' . b:sessiondir ' -empty -type d -delete'
  redraw!
endfunction

" saving and restoring vim-sessions
augroup sessions
  au!
  au VimEnter * nested :call LoadSession()
  au VimLeave,BufLeave * :call MakeSession()
augroup END
au SwapExists * au! sessions

