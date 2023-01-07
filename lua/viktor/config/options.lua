
vim.g.mapleader = ' ' -- Map leader key to space

vim.o.rnu = true         	-- relative line numbers
vim.o.nu = true         	-- line numbers
vim.o.mouse = 'a'       	-- mouse controls
vim.o.cursorline = true 	-- highlight line cursor is in
vim.o.modeline = true   	-- enable modlines for files
vim.o.modelines = 5			-- number of modelines
vim.o.signcolumn = 'yes'

vim.o.tabstop = 4 			-- 4 tabstop
vim.o.shiftwidth = 4
vim.o.expandtab = true    	-- tabs -> spaces
vim.o.swapfile = false
vim.o.wrap = false


vim.opt.ignorecase = true
vim.opt.undofile = true		-- file undo history preserved outside current session


vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
