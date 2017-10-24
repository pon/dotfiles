" Instantiate Plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set modelines=0
set wildmenu
set wildmode=list:longest
set esckeys
set ttyfast
set background=dark
colorscheme Tomorrow-Night-Eighties
set t_Co=256
set number
set relativenumber
set expandtab
set shiftround
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set foldenable
set foldlevelstart=20
set splitbelow
set splitright
set autoread
set laststatus=2
set backspace=indent,eol,start
set ruler
set showmode
set showcmd
set title
set showmatch
set matchtime=3
set gdefault
set timeoutlen=500

:autocmd FileType javascript setlocal cc=100

syntax on

" better moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map Q <Nop>

" also autosave when going to insert mode
inoremap kj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>

nnoremap <leader>l :NERDTreeToggle<CR>

nnoremap ; :
nnoremap : ;

let mapleader = ","
noremap <leader>p :set invpaste<CR>

if has('mouse')
  set mouse=a
endif

nnoremap <CR> :noh<CR><CR>

autocmd VimResized * wincmd =

highlight ColorColumn ctermbg=237 guibg=#3a3a3a

highlight Comment cterm=italic

set cursorline
augroup cline
  autocmd!
  autocmd WinLeave,InsertEnter * set nocursorline
  autocmd WinEnter,InsertLeave * set cursorline
augroup END

" Source the .vimrc file after saving it.  This way you don't have to reload
" Vim to see the changes.
augroup myvimrchooks
  autocmd!

  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backup
set noswapfile

let g:NERDTreeWinSize = 40
