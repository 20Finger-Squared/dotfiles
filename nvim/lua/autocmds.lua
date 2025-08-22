local autocommands = {
  {
    "BufEnter",
    {
      pattern = {
        "*.asm", "*.c", "*.cpp", "*.cs", "*.csx", "*.go", "*.h", "*.hpp",
        "*.java", "*.kdl", "*.md", "*.ps1", "*.py", "*.r", "*.rs", "*.s",
        "*.sh", "*.zig",
      },
      callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
      end,
    },
  },

  {
    "BufWinEnter",
    {
      pattern = { "*.md" },
      callback = function()
        vim.cmd("Markview splitToggle")
      end,
    },
  },

  {
    "BufWinEnter",
    {
      pattern = { "*.md", "*.txt", "*.tex" },
      callback = function()
        vim.opt.textwidth = 80
      end,
    },
  },

  {
    "BufEnter",
    {
      pattern = {
        "*.css", "*.hs", "*.html", "*.ipynb", "*.js", "*.json", "*.jsx",
        "*.lua", "*.nix", "*.rb", "*.svelte", "*.ts", "*.tsx", "*.xml",
      },
      callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
      end,
    },
  },
}

for _, autocmd in ipairs(autocommands) do
  vim.api.nvim_create_autocmd(autocmd[1], autocmd[2])
end
vim.o.updatetime = 300
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
          scope = "line",    -- show all diagnostics for the line
          focusable = false,
          border = "rounded",
          source = "always",
          close_events = { "CursorMoved", "InsertEnter", "BufLeave", "FocusLost" },
        })
      end,
    })
  end,
})
