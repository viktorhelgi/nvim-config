M = {}



M.mysplit = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local function is_cmd_map(str) 
    return string.sub(str, 1, 5) == "[cmd]"
end


local cmd_mappings
cmd_mappings = function(mode, tab, prefix)
    if prefix == nil then
        prefix = ''
    end


    -- vim.pretty_print(table)
    for k, v in pairs(tab) do
        local bind = prefix..k 
        if type(v) == 'table' then
            if v['require'] and v['cmd'] then
                local req = 'lua require("'..v['require']..'").'
                local cmd = v['cmd']
                vim.keymap.set(mode, bind, '<cmd>'..req..cmd..'<cr>')
                -- print(req)
                -- print(cmd)
            else
                M.cmd_mappings(mode, v, bind)
            end
        elseif type(v) == 'string' then
            if is_cmd_map(v) then
                v = "<cmd>" .. string.sub(v, 7, -1) .. "<cr>"
            end
            vim.keymap.set(mode, bind, v)
        end
    end
end

M.cmd_mappings = cmd_mappings


cmd_mappings('n', {
    ['t'] = {
        ["g"] = {
            ['s'] = '[cmd] Telescope git_status',
            ['b'] = '[cmd] Telescope git_branches',
            ['c'] = '[cmd] Telescope git_commits',
            ['d'] = { require = 'harpoon.mark', cmd = 'add_file()' },

            -- require_map('h\'', 'harpoon.mark', 'add_file')
        },
    }
})
return M
