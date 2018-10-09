" Instantiate Plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'ternjs/tern_for_vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'

call plug#end()

set modelines=0
set wildmenu
set wildmode=list:longest
set esckeys
set ttyfast
set background=dark
colorscheme molokai
set t_Co=256
set number
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
nnoremap <leader>a :Ack

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

highlight Comment cterm=bold

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

" The extra slash on the end saves files under the name of their full path
" with the / character replaced with a %.
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

let g:NERDTreeWinSize = 40

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|log\|tmp$|coverage\',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

augroup ft_javascript
  autocmd!

  autocmd FileType javascript setlocal foldmethod=syntax

  " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
  " positioned inside of them AND the following code doesn't get unfolded.
  autocmd Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space>.<cr><esc>kA<bs>
augroup END
