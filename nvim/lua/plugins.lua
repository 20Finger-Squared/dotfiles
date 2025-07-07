return {
  -- LSP Support
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd", "pyright", "lua_ls", "rust_analyzer", "tsserver", "gopls",
          "jsonls", "bashls", "marksman", "html", "cssls", "zls"
        },
        automatic_installation = true,
      })
    end,
  },
}