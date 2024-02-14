return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}

-- Theme
    use {'morhetz/gruvbox'}

-- Syntax
    use {'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end}
    use {'nvim-treesitter/nvim-treesitter-context'}

-- LSP
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'onsails/lspkind-nvim'}
    use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}


-- Completion
    -- use {'neoclide/coc.nvim', branch = 'release' }
    -- use {'chrisgrieser/cmp-nerdfont'} 
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use {'hrsh7th/cmp-nvim-lsp-document-symbol'}
    -- use {'zbirenbaum/copilot-cmp', after = {'copilot.lua'}, 
      -- config = function() 
        -- require('copilot_cmd').setup({
          -- method = 'getCompletionCycling',
          -- formatters = {
            -- label = require('copilot_cmp.format').format_label_text,
            -- insert_text = require("copilot_cmp.format").format_insert_text,
            -- preview = require("copilot_cmp.format").deindent,
          -- },
        -- }) 
      -- end}  
    use {'hrsh7th/nvim-cmp'}

    -- use {'ervandew/supertab'}

-- Snippets

    use {'dcampos/nvim-snippy'}
    use {'honza/vim-snippets'}
    use {'dcampos/cmp-snippy'}

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
    use {'hrsh7th/cmp-copilot'}

    -- use {'ctrlpvim/ctrlp.vim'} -- Fuzzy file, buffer, mru, tag, etc finder
    use {'junegunn/fzf', run=":call fzf#install()"} -- Fuzzy finder

    use {'luochen1990/rainbow'} -- Rainbow parentheses

    use {'majutsushi/tagbar'} -- Displays tags in a window, ordered by scope

    -- use {'sheerun/vim-polyglot'} -- Syntax highlighting
    
    use {'zhimsel/vim-stay'} -- Stay in the same window when opening files

    use {'Konfekt/FastFold'} -- Fast folding

    -- use {'tmhedberg/SimpylFold'} -- Fast folding

    -- use {'raimondi/delimitmate'} -- Insert mode auto-completion for quotes, parens, brackets, etc

    use {'christoomey/vim-tmux-navigator'} -- Seamless navigation between tmux panes and vim splits

    use {'vim-autoformat/vim-autoformat'} -- Autoformat code

    use {'yuttie/comfortable-motion.vim'} -- Smooth scrolling

    use {'nvim-tree/nvim-web-devicons'} -- Icons for NERDTree

    use {'tribela/vim-transparent'} -- Vim transparent

    use {'skywind3000/asynctasks.vim'} -- Task for filetypes

    use {'skywind3000/asyncrun.vim'} -- Asynchronous build and test runner

end)
