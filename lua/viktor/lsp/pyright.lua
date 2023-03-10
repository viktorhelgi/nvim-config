
local on_attach = function(_, bufnr)
    local cmp = require('cmp')

    local cmp_source = function(wanted_kind)
        return {
                config = {
                    sources = cmp.config.sources({ {
                        name = 'nvim_lsp',
                        entry_filter = function(entry, _)
                            local label =  entry.completion_item.label
                            local received_kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]

                            if wanted_kind == "Property" then
                                if string.sub(label,0,1) == "_" then
                                    return false
                                end
                                return received_kind == "Variable"
                            end
                            return received_kind == wanted_kind
                        end
                    } })
                }
            }
    end

    local opts = { noremap = true, silent = false }
    local opt = { noremap = true, silent = false, buffer = bufnr }

    vim.keymap.set('i', '<C-X><C-v>', cmp.mapping.complete(cmp_source('Variable')), opt)
    vim.keymap.set('i', '<C-X><C-p>', cmp.mapping.complete(cmp_source('Property')), opt)
    vim.keymap.set('i', '<C-X><C-m>', cmp.mapping.complete(cmp_source('Module')), opt)
    vim.keymap.set('i', '<C-X><C-c>', cmp.mapping.complete(cmp_source('Class')), opt)
    vim.keymap.set('i', '<C-X><C-f>', cmp.mapping.complete(cmp_source('Function')), opt)

        vim.keymap.set('i', '<C-n>', function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, opts)
        vim.keymap.set('i', '<C-p>', function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, opts)


    -- require('lsp_signature').on_attach(require('config.plug.lsp_signature_config'), bufnr) -- no need to specify bufnr if you don't use toggle_key
    vim.o.wrap = false

    vim.opt.colorcolumn = '100'

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', '<space>[', vim.diagnostic.goto_prev, opt)
    vim.keymap.set('n', '<space>]', vim.diagnostic.goto_next, opt)

    vim.keymap.set('n', 'gef', vim.diagnostic.open_float, opt)
    vim.keymap.set('n', 'geq', vim.diagnostic.setloclist, opt)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opt)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opt)
    -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opt)
    vim.keymap.set({ 'n' }, 'gs', function()
        require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

    vim.keymap.set({ 'n' }, '<Leader>k', function()
        vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' })


    -- vim.keymap.set('n', 'lr', vim.lsp.buf.references, opt)

    -- vim.api.nvim_set_keymap('n', 'gd',       '<cmd>lua vim.lsp.buf.definition()<CR>zt', opts)
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opt)
    vim.keymap.set('n', '<C-g>', require('telescope.builtin').lsp_definitions, opt)
    vim.keymap.set('n', 'gt', require('telescope.builtin').lsp_type_definitions, opt)
    vim.keymap.set('n', '<C-t>', require('telescope.builtin').lsp_type_definitions, opt)
    -- vim.keymap.set('n', 'gC', require('telescope.builtin').lsp_document_symbols({query="def"})<CR>', opt)
    -- vim.keymap.set('n', 'gf', require('pytrize.api').jump_fixture, opt)


    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opt)
    vim.keymap.set('n', '<leader>lI', vim.lsp.buf.implementation, opt)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opt)
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opt)
    vim.keymap.set('n', '<leader>ld', require('telescope.builtin').lsp_definitions, opt)
    vim.keymap.set('n', '<leader>lt', require('telescope.builtin').lsp_type_definitions, opt)
    vim.keymap.set('n', '<leader>lf', function () vim.cmd('Format') end, opt)
    -- vim.keymap.set('n', '<leader>lc', require('telescope.builtin').lsp_workspace_symbols({query="def"})<CR>', opt)
    -- vim.keymap.set('n', '<leader>lC', require('telescope.builtin').lsp_document_symbols({query="def"})<CR>', opt)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rt', '<CMD>TestFile --disable-warnings -s <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<CMD>TestNearest --disable-warnings -s <CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rl', '<CMD>TestLast<CR>', opts)


    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>jr', ':call jupyter_ascending#restart()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>je', ':call jupyter_ascending#execute()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ja', ':call jupyter_ascending#execute_all()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>jr', ':call jupyter_ascending#restart()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>je', ':call jupyter_ascending#execute()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ja', ':call jupyter_ascending#execute_all()<CR>', opts)
    --
    require('lint').linters_by_ft = {
      python = {'mypy'},
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
end

local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
    cmd = { "/home/viktor/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" },
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true
            }
        }
    },
    filetypes = { "python" },
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern({
        'Pipfile',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        -- 'requirements.txt',
        'requirements.yml',
        'pyrightconfig.json',
    })
})
