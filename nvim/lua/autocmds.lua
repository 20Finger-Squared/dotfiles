vim.api.create_autocmd("BufEnter", {
            pattern = {
                "*.asm", "*.c", "*.cpp", "*.cs", "*.csx", "*.go", "*.h", "*.hpp",
                "*.java", "*.kdl", "*.md", "*.ps1", "*.py", "*.r", "*.rs", "*.s",
                "*.sh", "*.zig",
            },
            callback = function()
                vim.opt.shiftwidth = 4
                vim.opt.tabstop = 4
            end
        })

vim.api.create_autocmd("BufWinEnter", {
            pattern = { "*.md" },
            callback = function()
                vim.cmd("Markview splitToggle")
            end
        }, })

vim.api.create_autocmd("BufWinEnter", {
            pattern = { "*.md", "*.txt", "*.tex" },
            callback = function()
                vim.opt.textwidth = 80
            end
        })

vim.api.create_autocmd("BufEnter", {
            pattern = {
                "*.css", "*.hs", "*.html", "*.ipynb", "*.js", "*.json", "*.jsx",
                "*.lua", "*.nix", "*.rb", "*.svelte", "*.ts", "*.tsx", "*.xml",
            },
            callback = function()
                vim.opt.shiftwidth = 2
                vim.opt.tabstop = 2
            end
        })

local grp = vim.api.nvim_create_augroup("DiagFloatOnMove", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = grp,
    callback = function(args)
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = grp,
            buffer = args.buf,
            callback = function()
                if vim.fn.mode() ~= "n" then return end
                vim.diagnostic.open_float(nil, {
                    scope = "line", -- show all diagnostics for the line
                    focusable = false,
                    border = "rounded",
                    source = "always",
                    close_events = { "CursorMoved", "InsertEnter", "BufLeave", "FocusLost" },
                })
            end,
        })
    end,
})

-- If an lsp is attached to buffer sett these keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local set = vim.keymap.set
        local builtin = require("telescope.builtin")

        opts.desc = "Show LSP references"
        set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        set("n", "gd", builtin.lsp_definitions, opts)

        opts.desc = "Show LSP implementations"
        set("n", "gi", builtin.lsp_implementations, opts)

        opts.desc = "Show LSP type definitions"
        set("n", "gt", builtin.lsp_type_definitions, opts)

        opts.desc = "Show buffer diagnostics"
        set("n", "<leader>D", builtin.diagnostics({ bufnr = 0 }), opts)

        opts.desc = "See available code actions"
        set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show line diagnostics"
        set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Restart LSP"
        set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end,
})
