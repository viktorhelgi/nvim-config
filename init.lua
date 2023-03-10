
---return string[]
local function mysplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

for i, path in ipairs(mysplit(vim.opt.packpath._value, ",")) do
    -- print("path: " .. path)
    if path:match(vim.fn.expand("~")) then
        local path_mod = path:gsub(".local/share", "repos/nvim/.local"):gsub(".config/nvim", "repos/nvim"):gsub(".cache/nvim", "repos/nvim/.cache")
        vim.opt.packpath:remove(path)
        vim.opt.packpath:prepend(vim.fn.expand(path_mod))
        -- print("      " .. path_mod)
    end
end
for i, path in ipairs(mysplit(vim.opt.runtimepath._value, ",")) do
    -- print("path: " .. path)
    if path:match(vim.fn.expand("~")) then
        local path_mod = path:gsub(".local/share/nvim/site", "repos/nvim/.packpath/site"):gsub(".config/nvim", "repos/nvim"):gsub(".cache/nvim", "repos/nvim/.cache")
        vim.opt.runtimepath:remove(path)
        vim.opt.runtimepath:prepend(vim.fn.expand(path_mod))
        -- print("      " .. path_mod)
    end
end
--
-- vim.opt.packpath:prepend(vim.fn.expand("~/repos/nvim/.packpath/site/pack").."/*/start/*")
-- vim.opt.packpath:prepend(vim.fn.expand("~/repos/nvim/.packpath/site/pack").."/*/opt/*")
vim.opt.packpath:prepend(vim.fn.expand("~/repos/nvim/.packpath/site/pack/packer/opt/packer.nvim"))

vim.opt.runtimepath:prepend(vim.fn.expand("~/repos/nvim/lua"))
vim.opt.packpath:prepend(vim.fn.expand("~/repos/nvim/lua"))


vim.opt.runtimepath:append(vim.fn.expand("~/repos/nvim"))
vim.opt.packpath:append(vim.fn.expand("~/repos/nvim/.packpath/site"))

vim.g.user_home = vim.fn.expand("~/repos/nvim/")



require('viktor')
