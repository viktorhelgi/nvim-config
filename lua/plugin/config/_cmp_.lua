
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- local CmpWindow = require('cmp.config.window')
local CmpConfigSources = require("cmp.config.sources")
-- local lspkind = require('lspkind')

-- Set up nvim-cmp.
local cmp = require('cmp')
local lspkind = require("lspkind.init")
if cmp ~= nil then
    cmp.setup({
        -- snippet = {
        --     -- REQUIRED - you must specify a snippet engine
        --     expand = function(args)
        --         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        --         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        --         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        --         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        --     end,
        -- },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
        })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })


    local cmp_setup_rust = {
        mapping = cmp.mapping.preset.insert({
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete({}),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Tab>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = CmpConfigSources({
            { name = 'nvim_lsp' },
            { name = 'path' }
        }, {
            { name = 'buffer' }
        }
        ),
        formatting = {

            ---@param entry cmp.Entry
            ---@param vim_item vim.CompletedItem
            format = function(entry, vim_item)
                -- fancy icons and a name of kind
                -- entry.get_word
                vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
                -- set a name for each source
                vim_item.menu = ({
                    buffer = "「Buffer」",
                    nvim_lsp = "「Lsp」",
                    luasnip = "「luasnip」",
                })[entry.source.name]

                vim_item.menu = entry:get_completion_item().detail
                return vim_item
            end,
        }
    }
    cmp.setup.filetype('rust', cmp_setup_rust)


    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
        capabilities = capabilities
    }

    local lspkind_configs = {
        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',

        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
            Text = "", Method = "", Function = "", Constructor = "",
            Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "",
            Module = "", Property = "ﰠ", Unit = "塞", Value = "",
            Enum = "", Keyword = "", Snippet = "", Color = "",
            File = "", Reference = "", Folder = "", EnumMember = "",
            Constant = "", Struct = "פּ", Event = "", Operator = "",
            TypeParameter = ""
        },
    }

    require('lspkind').init(lspkind_configs)
end
