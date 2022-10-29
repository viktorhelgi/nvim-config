


M = {}

-- options
vim.g.material_style = "darker"



-- specifies line style
M.lualine_style_left = ''
M.lualine_style_right = ''

-- specifies line seperator style
M.lualine_seperator_left = ''
M.lualine_seperator_right = ''

---------------------------------------
-- tablie -----------------------------
---------------------------------------
-- tabline styles
M.tabline_style_left = ''
M.tabline_style_right = ''

-- tabline seperator
M.tabline_seperator_left = ''
M.tabline_seperator_right = ''


---------------------------------------
-- functions --------------------------
---------------------------------------

-- pretty wrapper for loading theme files
-- @param choice string
-- The scheme name to load
function M.load_scheme(choice)
	-- require('themes.' .. choice)
    if choice==nil  then
        vim.api.nvim_cmd({cmd="colorscheme", args={"dracula"}}, {})
        -- local scheme_loaded = true
    else
        vim.api.nvim_cmd({cmd="colorscheme", args={choice}}, {})
    end
end


return M
