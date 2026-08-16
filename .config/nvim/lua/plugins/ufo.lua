--- https://github.com/kevinhwang91/nvim-ufo
--- https://pastebin.com/4h8W1jXa

return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",

    config = function()
        vim.o.foldcolumn = "0"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " ", }

        -- https://www.reddit.com/r/neovim/comments/13u9brg/remove_the_fold_level_numbers_using_the/
        local fcs = vim.opt.fillchars:get()
        local function get_fold(lnum)
            if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
                return " "
            end
            return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
        end
        _G.get_statuscol = function()
            return "%s%l " .. get_fold(vim.v.lnum) .. " "
        end
        vim.o.statuscolumn = "%!v:lua.get_statuscol()"

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require("lspconfig")[ls].setup({
                capabilities = capabilities,
            })
        end

        require("ufo").setup()
    end,
}

