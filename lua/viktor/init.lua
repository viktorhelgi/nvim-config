
-- vim.cmd [[packadd packer]]

local packer = require('packer')
packer.init({
    package_root = vim.fn.expand("~/repos/nvim/.packpath/site/pack"),
    compile_path = vim.fn.expand("~/repos/nvim/plugin/packer_compiled.lua")
    })

require('viktor.plug')
require('viktor.config.init')
-- require('config')
require('viktor.lsp.init')
require('viktor.vim.filetype')

