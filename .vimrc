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
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
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

set colorcolumn=79

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

" fzf plugin
let $FZF_DEFAULT_OPTS="--bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--ignore=tags --ignore=cscope.out',
  \                 fzf#vim#with_preview(), <bang>0)
nnoremap <silent> <Leader>] :Ag <C-R><C-W><CR>
"nnoremap <silent> g] :Tags <C-R><C-W><CR>
nnoremap <silent> <Leader>g] :BTags<CR>

" toggle keeping cursor in the middle all the time
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

colorscheme sublimemonokai

" markdown integration
autocmd Bufread *.md  setlocal textwidth=0
let g:markdown_folding=1
let g:vim_markdown_conceal=1
"autocmd Bufread *.md  setlocal conceallevel=2
command! Glow vert term glow %


