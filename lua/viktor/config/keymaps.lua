local km = vim.keymap

-- {{ [t]

_G.Funcs = require('viktor.lib.funcs')

local utils = "require('telescope.utils')."
local ts = {
    builtin = "require('telescope.builtin').",
    utils   = utils,
    cur_buf = "cwd=" .. utils .. "buffer_dir()"
}
local send_r = ':lua require("harpoon.term").sendCommand(1, "\\r")<CR>'

-- _G.Funcs.

local tele = require('telescope.builtin')
-- tele.
require('viktor.lib.funcs').cmd_mappings('n',
    {
        ["'"] = {
            ["h"] = { require = "harpoon.ui", cmd = 'nav_file', args = 1 },
            ["t"] = { require = "harpoon.ui", cmd = 'nav_file', args = 2 },
            ["n"] = { require = "harpoon.ui", cmd = 'nav_file', args = 3 },
            ["s"] = { require = "harpoon.ui", cmd = 'nav_file', args = 4 },
            ["-"] = { require = "harpoon.ui", cmd = 'nav_file', args = 5 },
            ["\\"] = { require = "harpoon.ui", cmd = 'nav_file', args = 6 },
            ["m"] = { require = "harpoon.term", cmd = 'gotoTerminal', args = 1 },
            ["w"] = { require = "harpoon.term", cmd = 'gotoTerminal', args = 2 },
            ["c"] = '[cmd] ClangdSwitchSourceHeader',
            ["q"] = "[cmd] Fcarbon %:p:h"
        },
        ['y'] = {
            ['s'] = 'viw"ly',
        },
        ['g'] = {
            ['d'] = '[cmd] lua vim.lsp.buf.definition()',
            ['h'] = '[cmd] lua vim.lsp.buf.hover()',
            ['k'] = '[cmd] lua vim.lsp.buf.hover()',
            ['s'] = '[cmd] lua vim.lsp.buf.signature_help()',
            ['t'] = { require = 'telescope.builtin', cmd = 'lsp_type_definitions' },
            -- [';'] = '[cmd] lua print(\'<C-R>l\')<CR>'
        },
        ['<leader>'] = {
            [']'] = '[cmd] lua vim.diagnostic.goto_next()',
            ['['] = '[cmd] lua vim.diagnostic.goto_next()',
            [','] = "[cmd] Telescope file_browser path=%:p:h",
            ['~'] = "[cmd] messages",
            [';'] = {
                ['t'] = '[cmd] NvimTreeToggle',
                ['f'] = '[cmd] NvimTreeFindFile',
                ['r'] = '[cmd] NvimTreeRefresh'
            },
            ['b'] = {
                ['n'] = '[cmd] bn',
                ['p'] = '[cmd] bp'
            },
            ['c'] = {
                ['c'] = '<cmd>ccl<cr><cmd>TroubleClose<cr>',
                ['o'] = '[cmd] copen',
                ['n'] = '[cmd] cn',
                ['p'] = '[cmd] cp',
                ['s'] = ':vimgrep /\\.<C-r>l/g %<CR>:Trouble quickfix<CR>',
            },
            ['e'] = {
                ['c'] = '[cmd] cd %:p:h',
                ['f'] = {
                    ['i'] = '[cmd] set foldmethod=indent',
                    ['s'] = '[cmd] set foldmethod=syntax',
                    ['m'] = '[cmd] set foldmethod=manual'
                },
                ['h'] = '[cmd] set hlsearch!',
                ['p'] = '"+p',
                ['s'] = '[cmd] so %',
                ['t'] = {
                    ['v'] = '[cmd] vs | terminal<CR>i',
                    ['s'] = '[cmd] sp | terminal<CR>i',
                },
                ['-'] = '[cmd] cd ..',
            },
            ['h'] = {
                ["'"] = { require = 'harpoon.mark', cmd = 'add_file' },
                ['t'] = { require = 'harpoon.ui', cmd = 'toggle_quick_menu' },
                ['n'] = { require = 'harpoon.ui', cmd = 'nav_next' },
                ['p'] = { require = 'harpoon.ui', cmd = 'nav_prev' },
            },
            ['o'] = {
                ['l'] = '[cmd] Trouble loclist',
                ['q'] = '[cmd] Trouble quickfix',
                ['r'] = '[cmd] Trouble lsp_references',
                ['f'] = '[cmd] Trouble lsp_definitions',
                ['i'] = '[cmd] Trouble lsp_implementations',
                ['t'] = '[cmd] Trouble lsp_type_definitions',
                ['d'] = '[cmd] Trouble document_diagnostics',
                ['w'] = '[cmd] Trouble workspace_diagnostics',
            },
            -- require_map('h\'', 'harpoon.mark', 'add_file')
            -- require_map('ht', 'harpoon.ui', 'toggle_quick_menu')
            -- require_map('hn', 'harpoon.ui', 'nav_next')
            -- require_map('hp', 'harpoon.ui', 'nav_prev')
            ['l'] = {
                ['a'] = '[cmd] lua vim.lsp.buf.code_action()',
                -- ['c'] = {
                --     ['r'] = '[cmd] lua vim.lsp.buf.clear_references()',
                --     ['a'] = '[cmd] lua vim.lsp.buf.code_action()',
                --     ['c'] = '[cmd] lua vim.lsp.buf.completion()',
                -- },
                ['d'] = {
                    -- ['c'] = '[cmd] lua vim.lsp.buf.declaration()',
                    -- ['f'] = '[cmd] lua vim.lsp.buf.definition()',
                    ['h'] = '[cmd] lua vim.lsp.buf.document_highlight()',
                    ['s'] = '[cmd] lua vim.lsp.buf.document_symbol()',
                },
                ['e'] = '[cmd] lua vim.lsp.buf.execute_command()',
                ['f'] = '[cmd] lua vim.lsp.buf.format()',
                -- ['f'] = { ['1'] = '[cmd] lua vim.lsp.buf.format()', ['2'] = '[cmd] lua vim.lsp.buf.formatting()', ['3'] = '[cmd] lua vim.lsp.buf.formatting_seq_sync()', ['4'] = '[cmd] lua vim.lsp.buf.formatting_sync()', },
                ['h'] = '[cmd] lua vim.lsp.buf.hover()',
                ['i'] = '[cmd] lua vim.lsp.buf.implementation()',
                ['I'] = '[cmd] lua vim.lsp.buf.incoming_calls()',
                ['o'] = '[cmd] lua vim.lsp.buf.outgoing_calls()',
                ['r'] = {
                    ['c'] = '[cmd] lua vim.lsp.buf.range_code_action()',
                    ['f'] = '[cmd] lua vim.lsp.buf.range_formatting()',
                    ['e'] = '[cmd] lua vim.lsp.buf.references()',
                    ['n'] = '[cmd] lua vim.lsp.buf.rename()',
                },
                ['s'] = {
                    ['r'] = '[cmd] lua vim.lsp.buf.server_ready()',
                    ['h'] = '[cmd] lua vim.lsp.buf.signature_help()',
                },
                ['t'] = '[cmd] lua vim.lsp.buf.type_definition()',
                ['w'] = {
                    ['a'] = '[cmd] lua vim.lsp.buf.add_workspace_folder()',
                    ['r'] = '[cmd] lua vim.lsp.buf.remove_workspace_folder()',
                    ['l'] = '[cmd] lua vim.lsp.buf.list_workspace_folders()',
                }
            },
            ['L'] = {
                ['i'] = '[cmd] LspInfo',
                ['m'] = '[cmd] Mason',
            },
            ['P'] = {
                ['r'] = '[cmd] PackerClean',
                ['c'] = '[cmd] PackerCompile',
                ['i'] = '[cmd] PackerInstall',
                ['l'] = '[cmd] PackerLoad',
                ['p'] = '[cmd] PackerProfile',
                ['s'] = '[cmd] PackerStatus',
                ['u'] = '[cmd] PackerUpdate',
                ['S'] = {
                    ['c'] = '[cmd] PackerSnapshot',
                    ['d'] = '[cmd] PackerSnapshotDelete',
                    ['r'] = '[cmd] PackerSnapshotRollback',
                },
                ['-'] = '[cmd] PackerSync',
            },
            ['t'] = {
                ['u'] = '[cmd] lua require("telescope.builtin").find_files()',
                ['e'] = '[cmd] lua require("telescope.builtin").find_files({' .. ts.cur_buf .. '})',
                ['o'] = '[cmd] lua require("telescope.builtin").find_files()',
                ['k'] = '[cmd] lua require("telescope.builtin").live_grep()',
                ['j'] = '[cmd] lua require("telescope.builtin").live_grep({' .. ts.cur_buf .. '})',
                ['g'] = {
                    ['s'] = '[cmd] Telescope git_status',
                    ['b'] = '[cmd] Telescope git_branches',
                    ['c'] = '[cmd] Telescope git_commits',
                },
                ["'"] = '[cmd] lua require("telescope.builtin").marks()',
                ['m'] = '[cmd] lua require("telescope.builtin").keymaps()',
                -- ['h'] = '[cmd] lua require("telescope.builtin").help_tags()',
                -- ['c'] = '[cmd] lua require("telescope.builtin").commands()',
                ['n'] = '[cmd] lua require("trouble").next({skip_groups = true, jump = true})',
                ['h'] = '[cmd] lua require("trouble").previous({skip_groups = true, jump = true})',
                ['p'] = '[cmd] lua require("trouble").previous({skip_groups = true, jump = true})',
                ['c'] = '[cmd] TroubleClose',
                ['r'] = '[cmd] TroubleRefresh',
                -- ['t'] = '[cmd] TroubleToggle',
                ['a'] = '[cmd] Telescope aerial',
            },
            ['q'] = '[cmd] q',
            ['s'] = '[cmd] w',
            ['z'] = '[cmd] ZenMode',
            ['/'] = '[cmd] b#',
        },

    })

require('viktor.lib.funcs').cmd_mappings('i', {
    --    ['<C-o>'] = '<C-x><C-o>',
    -- ['<C-o>'] = '[cmd] lua vim.lsp.buf.completion()',
    ['<C-f>'] = '<C-x><C-f>',
})

require('viktor.lib.funcs').cmd_mappings('v',
    {
        ['<leader>'] = {
            ['e'] = {
                ['y'] = '"+y'
            }
        }
    })

require('viktor.lib.funcs').cmd_mappings('t',
    {
        ["<esc>"] = '<C-\\><C-n>',
        ["<C-q>"] = '<C-\\><C-n>',
        ["<C-j>"] = '<Down>',
        ["<C-k>"] = '<Up>',
    })

require('viktor.lib.funcs').cmd_mappings('c',
    {
        ['<C-j>'] = '<Down>',
        ['<C-k>'] = '<Up>',
    })
-- }}}




-- local set_material_colorscheme = function(bind, style)
--     km.set('n', '<leader>'..bind, '<cmd>lua vim.g.material_style = "'..style..'"<cr><cmd>colorscheme material<cr>', opts)
-- end
--
-- set_material_colorscheme(';','darker')
-- set_material_colorscheme(',','lighter')
-- set_material_colorscheme('.','oceanic')
-- set_material_colorscheme('p','palenight')
-- set_material_colorscheme('y','deep ocean')
