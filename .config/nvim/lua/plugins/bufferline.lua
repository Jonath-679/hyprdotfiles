--- https://github.com/akinsho/bufferline.nvim

return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',

	config = function()
		require("bufferline").setup({
			options = {
                close_command = function(n) Snacks.bufdelete(n) end,
                right_mouse_command = function(n) Snacks.bufdelete(n) end,
				mode = "buffers", --buffers, tabs
                separator_style = {"", ""},
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "--------------------------------------",
						highlight = "Directory",
						text_aligh = "center",
					}
				},
				custom_filter = function(buf, _)
					local ft = vim.bo[buf].filetype
					local bt = vim.bo[buf].buftype
					if bt == "nofile" then
						return false
					end
					if ft == "snacks_layout_box" or ft == "snacks_explorer" or ft == "snacks_picker_list" then
						return false
					end
					return true
				end,
			},
		})
	end
}

