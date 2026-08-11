--- https://github.com/akinsho/bufferline.nvim

return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',

	-- Configuration
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				always_show_bufferline = true,

				-- Reserva espacio para el panel lateral (Explorer)
				offsets = {
					{
						filetype = "snacks_layout_box", -- <- el más común en Snacks
						text = "--------------------------------------",
						highlight = "Directory",
						text_aligh = "center",
					}
				},

				-- No metas buffers especiales en la línea
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

