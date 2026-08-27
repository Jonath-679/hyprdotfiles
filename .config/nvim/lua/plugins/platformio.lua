--- https://github.com/anurag3301/nvim-platformio.lua

return {
    'anurag3301/nvim-platformio.lua',
    -- cmd = {'Pioinit', 'Piolib' },

    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'folke/which-key.nvim' },
        { 'nvim-treesitter/nvim-treesitter' },
        -- install picker based on your likeing
        { 'akinsho/toggleterm.nvim' },
    },

    config = function ()
        require("platformio").setup({
            lsp = "clangd",
            clangd_source = "compiledb",
            picker_backend = "auto", --ui_select
            menu_key = "<leader>p",
            debug = false
        })
    end
}

