set modelines=0

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartcase

set ruler

set visualbell

set encoding=utf-8

set wrap

set cursorline

set mouse=a

set hidden

set ttyfast

" set laststatus=2

" set showmode
set showcmd

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme gruvbox

let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
