
local r = "plugin/config"

return {
	require(r..'/_aerial_'),
	require(r..'/_cmp_'),
	require(r..'/_mason_'),
    require(r..'/_pretty-fold_'),
	require(r..'/_treesitter_'),
	require(r..'/_telescope_'),
    require(r..'/_windows_')
}
