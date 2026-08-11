return {
	"https://github.com/neovim/nvim-lspconfig",

	-- Configuration
	config = function()
		-- LSP'S
		vim.lsp.enable({'lua_ls', 'clangd', 'pyright', 'bashls', 'jsonls'})	
	end
}

