-- General
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>z", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set({ "n", "v" }, "U", "<C-r>", { desc = "Redo action" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without overwriting register" })
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Buffers
vim.keymap.set("n", "<C-PageDown>", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-PageUp>", ":bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader><BS>", function() Snacks.bufdelete() end, { desc = "Close buffer" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save buffer" })

-- Navigation 
vim.keymap.set("n", "J", "}", { desc = "Jump down paragraph" })
vim.keymap.set("n", "K", "{", { desc = "Jump up paragraph" })
vim.keymap.set("n", "H", "^", { desc = "Go to line start" })
vim.keymap.set("n", "L", "$", { desc = "Go to line end" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down centered" })

-- Windows 
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>-", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize window sizes" })

-- Maintain visual mode after indenting | Mantener modo visual tras indentar
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Move text up or down | Mover texto hacia arriba y abajo
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- LSP | Language Server Protocol
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "LSP Hover information" })
vim.keymap.set("n", "gH", vim.diagnostic.open_float, { desc = "LSP Open diagnostic float" })
vim.keymap.set("n", "gr", vim.lsp.buf.rename, { desc = "LSP Rename symbol" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "LSP Go to type definition" })

-- C/C++: Compile & run (<leader>cr)
vim.keymap.set("n", "<leader>cr", function()
    -- Save and get paths 
    vim.cmd("w")
    local src = vim.fn.expand("%:p") -- Full path
    local dir = vim.fn.expand("%:p:h") -- Current directory path
    local name = vim.fn.expand("%:t:r") -- File name without extension
    local ext = vim.fn.expand("%:e") -- File extension (c, cpp, etc.)
    local run_dir = dir .. "/.RUN" -- Hidden folder
    local out = run_dir .. "/" .. name -- Final executable path
    -- Determine compiler and standard based on file extension
    local compiler = ""
    local std = ""
    if ext == "c" then
        compiler = "gcc"
        std = "-std=c11"
    elseif ext == "cpp" or ext == "cc" or ext == "cxx" then
        compiler = "g++"
        std = "-std=c++17"
    else
        vim.notify("Not a C or C++ file!", vim.log.levels.WARN)
        return
    end
    -- Create the .RUN folder if it doesn't exist
    vim.fn.mkdir(run_dir, "p")
    -- Escape paths for safety (in case there are spaces in the folder names)
    local esc_src = vim.fn.shellescape(src)
    local esc_out = vim.fn.shellescape(out)
    -- Build command dynamically
    local cmd = string.format(
        "%s %s -O2 -Wall -Wextra -o %s %s && echo '--- Running ---' && %s",
        compiler, std, esc_out, esc_src, esc_out
    )
    -- Open the bottom terminal and execute
    vim.cmd("botright 15split | term " .. cmd)
    vim.cmd("startinsert")
end, { desc = "C/C++: Compile & Run" })

