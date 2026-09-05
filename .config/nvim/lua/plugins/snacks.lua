--- https://github.com/folke/snacks.nvim

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true, sources={explorer={layout={cycle=false}, hidden=true}}},
        notifier = { enabled = true, timeout = 5000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true }, -- smooth animation
        statuscolumn = { enabled = true },
        words = { enabled = true },
        image = { enabled = true },
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Find Files" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Find (with) Grep" },
        { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },

        -- git
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Open Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Open Lazygit Log" },

        -- Open terminal (current_dir)
        vim.keymap.set("n", "<leader>to", function()
            if vim.bo.buftype == "terminal" then
                vim.cmd("hide")
                return
            end
            local current_dir = vim.fn.expand("%:p:h")
            if current_dir == "" or vim.fn.isdirectory(current_dir) == 0 then
                current_dir = vim.fn.getcwd()
            end
            Snacks.terminal(nil, { cwd = current_dir, id = "local_term", win = { wo = { winbar = ""}}})
        end, { desc = "Open Terminal" }),

        -- Close terminal (hide) 
        vim.keymap.set({"n", "t"}, "<leader>tc", function()
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].buftype == "terminal" then
                    vim.api.nvim_win_close(win, true)
                end
            end
        end, { desc = "Close Terminal" }),

        -- Toggle terminal (current_dir)
        vim.keymap.set({"n", "t"}, "<C-S-t>", function()
            if vim.bo.buftype == "terminal" then
                vim.cmd("wincmd p")
                return
            end
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].buftype == "terminal" then
                    vim.api.nvim_set_current_win(win)
                    return
                end
            end
            local current_dir = vim.fn.expand("%:p:h")
            if current_dir == "" or vim.fn.isdirectory(current_dir) == 0 then
                current_dir = vim.fn.getcwd()
            end
            Snacks.terminal(nil, { cwd = current_dir, id = "local_term", win = { wo = { winbar = ""}}})
        end, { desc = "Focus or Open Terminal" })
    }
}

