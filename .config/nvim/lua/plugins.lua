return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}

-- Theme
    use {'morhetz/gruvbox'}

-- Completion
    use {'neoclide/coc.nvim', branch = 'release' }

-- Snippets
    use {'honza/vim-snippets'}

    use {'scrooloose/nerdtree'} -- File explorer

    use {'vim-airline/vim-airline'} -- Status bar
    use {'vim-airline/vim-airline-themes'} -- Status bar themes

    use {'tpope/vim-fugitive'} -- Git
    use {'tpope/vim-surround'} -- Surrounding text
    use {'tpope/vim-commentary'} -- Commenting text
    use {'tpope/vim-repeat'} -- Repeat commands
    use {'tpope/vim-unimpaired'} -- Pairs of handy bracket mappings
    use {'tpope/vim-endwise'} -- Endwise for Ruby
    use {'tpope/vim-abolish'} -- Search and replace
    use {'tpope/vim-dispatch'} -- Asynchronous build and test dispatcher
    use {'tpope/vim-speeddating'} -- Speed up date/time increments

    use {'easymotion/vim-easymotion'} -- Easy motion

    use {'github/copilot.vim'} -- Copilot

    -- use {'ctrlpvim/ctrlp.vim'} -- Fuzzy file, buffer, mru, tag, etc finder
    use {'junegunn/fzf', run=":call fzf#install()"} -- Fuzzy finder

    use {'luochen1990/rainbow'} -- Rainbow parentheses

    use {'majutsushi/tagbar'} -- Displays tags in a window, ordered by scope

    use {'sheerun/vim-polyglot'} -- Syntax highlighting
    
    use {'zhimsel/vim-stay'} -- Stay in the same window when opening files

    use {'Konfekt/FastFold'} -- Fast folding

    use {'tmhedberg/SimpylFold'} -- Fast folding

    use {'raimondi/delimitmate'} -- Insert mode auto-completion for quotes, parens, brackets, etc

    use {'christoomey/vim-tmux-navigator'} -- Seamless navigation between tmux panes and vim splits

    use {'vim-autoformat/vim-autoformat'} -- Autoformat code

    use {'yuttie/comfortable-motion.vim'} -- Smooth scrolling

    use {'ryanoasis/vim-devicons'} -- Icons for NERDTree

    use {'tribela/vim-transparent'} -- Vim transparent

    use {'skywind3000/asynctasks.vim'} -- Task for filetypes

    use {'skywind3000/asyncrun.vim'} -- Asynchronous build and test runner

end)
