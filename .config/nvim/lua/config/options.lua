-- Appearance 
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
vim.opt.pumheight = 10 -- max completion popup height
-- vim.opt.colorcolumn = "150" -- visual line-length guide
-- vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 5

-- Tabs & indentation 
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- clipboard and temporary files 
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlight the text briefly when copying (yanking) it. 
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Extra
-- vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 5 

-- Plugins
vim.g.mapleader = " "
vim.diagnostic.config({virtual_text=true})

