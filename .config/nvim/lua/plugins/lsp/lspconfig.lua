--- https://github.com/neovim/nvim-lspconfig 

return {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"},

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "pyright", "bashls", "jsonls" },
            automatic_installation = true,
        })

        -- Keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Go to definition"
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Hover information"
                vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)

                -- The following `vim.lsp.buf` functions are included natively within `gr`                                                                                                                                                                       

                -- opts.desc = "Rename symbol"
                -- vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

                -- opts.desc = "Go to references"
                -- vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)

                -- opts.desc = "Go to implementation"
                -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

                -- opts.desc = "Code Actions"
                -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        -- Lua
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
        })

        -- C/C++ 
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--header-insertion=never", --iwyu
            },
        })

        -- :LspStop
        vim.api.nvim_create_user_command("LspStop", function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            for _, client in ipairs(clients) do
                client:stop()
            end
            print("LSP detenido en el buffer actual.")
        end, {})

        -- :LspRestart
        vim.api.nvim_create_user_command("LspRestart", function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            for _, client in ipairs(clients) do
                local config = client.config
                client:stop()
                vim.defer_fn(function()
                    vim.lsp.start(config)
                end, 500) -- Espera medio segundo y lo vuelve a arrancar
            end
            print("LSP reiniciado.")
        end, {})

        -- :LspStart
        vim.api.nvim_create_user_command("LspStart", function()
            vim.cmd("doautocmd FileType " .. vim.bo.filetype)
            print("LSP iniciado.")
        end, {})

        -- :LspInfo
        vim.api.nvim_create_user_command("LspInfo", function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
                print("Ningún servidor LSP activo en este buffer.")
                return
            end
            print("Servidores LSP activos en este archivo:")
            for _, client in ipairs(clients) do
                print(" • " .. client.name .. " (ID: " .. client.id .. ")")
            end
        end, {})
    end
}

