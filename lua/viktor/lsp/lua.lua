

local lsp_signature_configs = require('viktor.config.lsp_signature')
    lsp_signature_configs.toggle_key = '<C-s>' -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    lsp_signature_configs.select_signature_key = '<M-n>'

local on_attach = function(_, bufnr)
    local opts = {silent = true, buffer = bufnr}

    -- require('lsp_signature').on_attach(lsp_signature_configs, bufnr) -- no need to specify bufnr if you don't use toggle_key
    -- vim.
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.keymap.set( 'n', '<leader>at', '<cmd>AerialToggle!<CR>', opts)
    vim.keymap.set( 'n', '<leader>a{', '<cmd>AerialPrev<CR>', opts)
    vim.keymap.set( 'n', '<leader>a}', '<cmd>AerialNext<CR>', opts)
    vim.keymap.set( 'n', '<leader>a[', '<cmd>AerialPrevUp<CR>', opts)
    vim.keymap.set( 'n', '<leader>a]', '<cmd>AerialNextUp<CR>', opts)

    vim.wo.foldmethod = 'indent' -- set fold method to marker
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = false


local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- version = 'lua5.4',
                -- path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
