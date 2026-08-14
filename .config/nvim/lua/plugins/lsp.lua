--- https://github.com/neovim/nvim-lspconfig 

return {
	"https://github.com/neovim/nvim-lspconfig",

	config = function()
		vim.lsp.enable({'lua_ls', 'clangd', 'pyright', 'bashls', 'jsonls'}) -- LSP'S
	end
}

