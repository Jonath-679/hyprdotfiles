--- https://github.com/L3MON4D3/LuaSnip

return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",

    config = function ()
        -- Load snippets
        require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    end,
}

