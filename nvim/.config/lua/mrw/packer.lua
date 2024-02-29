-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use("navarasu/onedark.nvim")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")
    -- use("mbbill/undotree")
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use({
        "L3MON4D3/LuaSnip",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use("windwp/nvim-autopairs")
    use('lervag/vimtex')
    use('numToStr/Comment.nvim')
    use("LudoPinelli/comment-box.nvim")
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use("tpope/vim-fugitive")
    use {
        "ThePrimeagen/harpoon",
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use("tpope/vim-eunuch")
    use {
        "nvimtools/none-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
    use("jay-babu/mason-null-ls.nvim")
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("tpope/vim-obsession")
    use("christoomey/vim-tmux-navigator")
    use("Canop/nvim-bacon")
    -- Close unused buffers after x mins of inactivity
    use("chrisgrieser/nvim-early-retirement")
    -- Highlight TODO comments
    use({
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    })
    -- Typescript // ^? queries
    use("marilari88/twoslash-queries.nvim")
    use("ggandor/leap.nvim")
    -- Lorem Ipsum generator
    use("derektata/lorem.nvim")
    use({
        "kaarmu/typst.vim",
        ft = { "typst" }
    })
end)
