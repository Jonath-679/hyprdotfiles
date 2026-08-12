--- https://github.com/folke/snacks.nvim

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		explorer = { enabled = true },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		picker = {enabled=true, sources={explorer={layout={cycle=false}}}},
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
		terminal = { enabled = true }
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		
		-- Terminal
		{ "<leader>t",
			function()
				local buf_dir = vim.fn.expand("%:p:h")
				local valid_cwd = (vim.fn.isdirectory(buf_dir) == 1) and buf_dir or vim.fn.getcwd()
				Snacks.terminal.toggle(nil, {
					id = "terminal_principal",
					cwd = valid_cwd,
					win = {
						position = "bottom",
						height = 0.3,
						wo = {
							statusline = " ", 
							winbar = "",      
						}
					},
					start_insert = true,
					auto_insert = true,
					auto_close = false,
				})
			end,
			desc = "Terminal toggle abajo (split)",
			mode = { "n", "t" },
	   }
	}
}

