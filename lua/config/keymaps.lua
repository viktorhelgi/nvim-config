local km = vim.keymap

-- {{ [t]

Funcs = require('lib/funcs')

local utils = "require('telescope.utils')."
local ts = {
    builtin = "require('telescope.builtin').",
    utils   = utils,
    cur_buf = "cwd=" .. utils .. "buffer_dir()"
}
local send_r = ':lua require("harpoon.term").sendCommand(1, "\\r")<CR>'


Funcs.cmd_mappings('n',
    {

        ['g'] = {
            ['d'] = '[cmd] lua vim.lsp.buf.definition()',
            ['h'] = '[cmd] lua vim.lsp.buf.hover()',
            ['t'] = '[cmd] require(\'telescope.builtin\').lsp_type_definitions()',
        },
        ['<leader>'] = {
            ['b'] = {
                ['n'] = '[cmd] bn',
                ['p'] = '[cmd] bp'
            },
            ['d'] = {
                ['n'] = '[cmd] lua require("trouble").next({skip_groups = true, jump = true})',
                ['p'] = '[cmd] lua require("trouble").previous({skip_groups = true, jump = true})',
                ['f'] = '[cmd] lua require("trouble").first({skip_groups = true, jump = true})',
                ['l'] = '[cmd] lua require("trouble").last({skip_groups = true, jump = true})',
            },
            ['e'] = {
                ['p'] = '"+p',
                ['h'] = '[cmd] set hlsearch!',
                ['c'] = '[cmd] cd %:p:h',
                ['-'] = '[cmd] cd ..',
                ['s'] = '[cmd] so %',
                ['t'] = {
                    ['v'] = '[cmd] vs | terminal<CR>i',
                    ['s'] = '[cmd] sp | terminal<CR>i',
                },
            },
            ['h'] = {
                ["'"] = {require='harpoon.mark', cmd='add_file()'},
                ['t'] = {require='harpoon.ui', cmd='toggle_quick_menu()'},
                ['n'] = {require='harpoon.ui', cmd='nav_next()'},
                ['p'] = {require='harpoon.ui', cmd='nav_prev()'},
            },

            -- require_map('h\'', 'harpoon.mark', 'add_file')
            -- require_map('ht', 'harpoon.ui', 'toggle_quick_menu')
            -- require_map('hn', 'harpoon.ui', 'nav_next')
            -- require_map('hp', 'harpoon.ui', 'nav_prev')
            ['l'] = {
                ['f'] = '[cmd] lua vim.lsp.buf.format()',
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
                ['k'] = '[cmd] lua require("telescope.builtin").live_grep()',
                ['j'] = '[cmd] lua require("telescope.builtin").live_grep({' .. ts.cur_buf .. '})',
                ['g'] = {
                    ['s'] = '[cmd] Telescope git_status',
                    ['b'] = '[cmd] Telescope git_branches',
                    ['c'] = '[cmd] Telescope git_commits',
                },
                ["'"] = '[cmd] lua require("telescope.builtin").marks()',
                ['m'] = '[cmd] lua require("telescope.builtin").keymaps()',
                ['h'] = '[cmd] lua require("telescope.builtin").help_tags()',
                ['c'] = '[cmd] lua require("telescope.builtin").commands()'
            },
            ['q'] = '[cmd] q',
            ['w'] = '[cmd] w',
            ['x'] = {
                ['t'] = '[cmd] TroubleToggle',
                ['w'] = '[cmd] TroubleToggle workspace_diagnostics',
                ['d'] = '[cmd] TroubleToggle document_diagnostics',
                ['q'] = '[cmd] TroubleToggle quickfix',
                ['l'] = '[cmd] TroubleToggle loclist',
                ['r'] = '[cmd] TroubleToggle lsp_references',
            },
            ['@'] = '[cmd] b#',
        }
    })

Funcs.cmd_mappings('i', {
    ['<C-o>'] = '<C-x><C-o>',
    ['<C-f>'] = '<C-x><C-f>',
})

Funcs.cmd_mappings('v',
    {
        ['<leader>'] = {
            ['e'] = {
                ['y'] = '"+y'
            }
        }
    })

Funcs.cmd_mappings('t',
    {
        ["<esc>"] = '<C-\\><C-n>',
        ["<C-q>"] = '<C-\\><C-n>',
        ["<C-j>"] = '<Down>',
        ["<C-k>"] = '<Up>',
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
