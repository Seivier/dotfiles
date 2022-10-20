call plug#begin()

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf'
Plug 'sainnhe/everforest'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'sainnhe/sonokai'
Plug 'ajmwagar/vim-deus'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'vv9k/vim-github-dark'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree' " File explorer
Plug 'scrooloose/nerdcommenter' " Commenting
Plug 'scrooloose/syntastic' " Syntax checking

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'guns/vim-sexp'

" God tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-speeddating'


Plug 'easymotion/vim-easymotion'

Plug 'github/copilot.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'luochen1990/rainbow'

Plug 'majutsushi/tagbar'

Plug 'sheerun/vim-polyglot'

Plug 'Konfekt/FastFold'

Plug 'tmhedberg/SimpylFold'

Plug 'tribela/vim-transparent'

Plug 'raimondi/delimitmate'

Plug 'christoomey/vim-tmux-navigator' " Tmux navigation in vim

Plug 'vim-autoformat/vim-autoformat' " Autoformatting

Plug 'yuttie/comfortable-motion.vim' " Smooth scrolling

Plug 'ryanoasis/vim-devicons' " Icons

" Plug 'mnishz/colorscheme-preview.vim' " Color scheme preview

call plug#end()

nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pu :PlugUpdate<CR>
nmap <Leader>pc :PlugClean<CR>

