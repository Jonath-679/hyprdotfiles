-- Navegacion
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Mover a la ventana izquierda' })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Mover a la ventana de abajo' })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Mover a la ventana de arriba' })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Mover a la ventana derecha' })

-- Experimental
vim.keymap.set("n", "gb", ":bn<CR>", {silent=true})
vim.keymap.set("n", "gB", ":bp<CR>", {silent=true})
