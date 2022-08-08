return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- colorscheme
    --use 'luisiacc/gruvbox-baby'
    use 'morhetz/gruvbox'
   
    use "nvim-lua/plenary.nvim"

    -- lsp
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

    -- comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
            theme = "gruvbox_dark"
        }
    }
    -- using packer.nvim
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- auto pairs
    use("windwp/nvim-autopairs")

    -- treesittetr
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        config = function()
            require("conf.telescope")
        end
    }
    use "nvim-telescope/telescope-live-grep-args.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-ui-select.nvim' }
    -- media file preview extension for telescope
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-telescope/telescope-project.nvim"

    -- nvim-surround
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Welcome Home
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end,
    }
    -- cmp plugins
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("conf/cmp")
        end,
    } -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use "rafamadriz/friendly-snippets"
    -- use 'p00f/clangd_extensions.nvim'

    -- markdowm
    use "iamcco/markdown-preview.nvim"
    use 'dhruvasagar/vim-table-mode'

    -- which-key
    use {
        "folke/which-key.nvim",
        config = function()
            require("conf/which-key")
        end,
    }

    -- quick-select
    use "gcmt/wildfire.vim"

        
    -- float window
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = function()
            require("conf/toggleterm")
        end,
    }

    -- debugging
    -- use "ravenxrz/DAPInstall.nvim"
    use 'mfussenegger/nvim-dap'
    use "rcarriga/nvim-dap-ui"
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'


    -- notify
    use 'rcarriga/nvim-notify'

    -- quick-Find 
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
    
    --
    -- todo
    use "folke/todo-comments.nvim"
end)
