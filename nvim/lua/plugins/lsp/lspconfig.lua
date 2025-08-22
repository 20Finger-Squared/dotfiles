return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    [vim.diagnostic.severity.INFO]  = " ",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
                },
            },
        })

        require("mason-lspconfig").setup({
            handlers = {
                -- Default handler
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                completion = { callSnippet = "Replace" },
                            },
                        },
                    })
                end,

                ["svelte"] = function()
                    lspconfig["svelte"].setup({
                        capabilities = capabilities,
                        on_attach = function(client)
                            vim.api.nvim_create_autocmd("BufWritePost", {
                                pattern = { "*.js", "*.ts" },
                                callback = function(ctx)
                                    client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                                end,
                            })
                        end,
                    })
                end,

                ["graphql"] = function()
                    lspconfig["graphql"].setup({
                        capabilities = capabilities,
                        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                    })
                end,

                ["emmet_ls"] = function()
                    lspconfig["emmet_ls"].setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html", "typescriptreact", "javascriptreact",
                            "css", "sass", "scss", "less", "svelte"
                        },
                    })
                end,
            }
        })
    end,
}
