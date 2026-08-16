--- https://github.com/sindrets/diffview.nvim

return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },

    config = function()
        require("diffview").setup({
            enhanced_diff_hl = true,
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                },
            },
        })
    end,
    keys = {
        { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
 		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
    }
}

