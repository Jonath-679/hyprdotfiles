-- Appearance 
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
-- vim.opt.pumheight = 10 -- max completion popup height
-- vim.opt.colorcolumn = "150" -- visual line-length guide
-- vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 5
-- vim.opt.guicursor = "n:block-blinkon0,i-ci-ve:ver25-blinkwait250-blinkoff250-blinkon250"

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

-- Función para cerrar el buffer actual o salir de Neovim si es el último
_G.smart_q = function()
  local listed_buffers = vim.tbl_filter(function(buf)
    return vim.bo[buf].buflisted and vim.api.nvim_buf_is_valid(buf)
  end, vim.api.nvim_list_bufs())
  if #listed_buffers <= 1 then
    vim.cmd("q")
  else
    Snacks.bufdelete()
  end
end
vim.cmd([[
  cnoreabbrev <expr> q (getcmdtype() == ':' && getcmdline() == 'q') ? 'lua _G.smart_q()' : 'q'
]])

-- Extra
-- vim.opt.scrolloff = 5
-- vim.opt.sidescrolloff = 5 

-- Plugins
vim.g.mapleader = " "
vim.diagnostic.config({virtual_text=true})

