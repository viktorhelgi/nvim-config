-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)


    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
use "lewis6991/hover.nvim"


    -- {{{ Package Managers
    use 'wbthomason/packer.nvim'
    use "williamboman/mason.nvim"
    -- }}}
    -- {{{ color-schemas
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'dracula/vim', as = 'dracula' }
    use 'marko-cerovac/material.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'jacoborus/tender.vim'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/gruvbox-material'
    use 'mfussenegger/nvim-lint'
    -- }}}
    -- {{{ Looks
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    --}}}
    -- tools
    use 'stevearc/aerial.nvim'
    use 'ThePrimeagen/harpoon'
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = 'gcc',
                    ---Block-comment toggle keymap
                    block = 'gbc',
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = 'gc',
                    ---Block-comment keymap
                    block = 'gb',
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = 'gcO',
                    ---Add comment on the line below
                    below = 'gco',
                    ---Add comment at the end of line
                    eol = 'gcA',
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
                ---Function to call before (un)comment
                pre_hook = nil,
                ---Function to call after (un)comment
                post_hook = nil,
            }
            )
        end
    }
    use { "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        }, config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    }


    use { "cbochs/grapple.nvim",
        config = function()
            require("grapple").setup({
                -- Your configuration goes here
                -- Leave empty to use the default configuration
                -- Refer to the configuration section for more details
            })
        end
    }
    use { 'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup({})
        end }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- completions
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'hrsh7th/cmp-cmdline' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'onsails/lspkind-nvim' }) --}}}
    use({ 'hrsh7th/cmp-nvim-lsp-document-symbol' })
    -- use({'hrsh7th/cmp-nvim-lua'})

    -- lsp

    use "ray-x/lsp_signature.nvim"

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        } }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'simrat39/rust-tools.nvim'

    use { "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use('mbbill/undotree')
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },
    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }

    -- Lua
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- use {
    --     "startup-nvim/startup.nvim",
    --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    --     config = function()
    --         require "startup".setup()
    --     end
    -- }
    -- use {
    --     'SidOfc/carbon.nvim',
    --     branch = 'insanity'
    -- }

    --- task runner for typescript
    use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use {
        'jedrzejboczar/toggletasks.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'akinsho/toggleterm.nvim',
            -- 'nvim-telescope/telescope.nvim/',
        },
        -- To enable YAML config support
        rocks = 'lyaml',
    }

end)

