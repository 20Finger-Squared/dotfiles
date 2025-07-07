require("settings")
require("config.lazy")        -- sets up lazy.nvim with only valid plugin specs
require("keymaps")
require("lsp")                -- your lspconfig (tsserver = nil if needed)
require("autocmds")   -- just runs config, not a plugin spec
