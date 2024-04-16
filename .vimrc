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
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-abolish'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
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

" no sounds
set noerrorbells
set novisualbell

" turn off hlsearch
set nohlsearch

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

map <Space> <Leader>

" easymotion plugin
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_verbose = 0
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)

" toggle keeping cursor in the middle all the time
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

colorscheme sublimemonokai

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions/" . expand('%:p:h')
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/' . expand('%:t') . '.vim'
  set sessionoptions=buffers,folds,winsize,localoptions
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

" session only when there is not arg '+number' and swap does not exist
" and not diff mode
let g:cmd_args=split(system( "ps -o command= -p " . getpid()))
for item in g:cmd_args
  if item =~ '^+\d\+$' || item == '-d' || item == 'vimdiff' || item =~ 'diffthis'
    au! sessions
  endif
endfor
au SwapExists * au! sessions

