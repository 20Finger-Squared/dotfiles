local lspconfig = require("lspconfig")
local servers = {
  "clangd", "pyright", "lua_ls", "rust_analyzer", "gopls",
  "jsonls", "bashls", "marksman", "html", "cssls", "zls"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({})
end
