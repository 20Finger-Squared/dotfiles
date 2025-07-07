vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.asm", "*.c", "*.cpp", "*.cs", "*.csx", "*.go", "*.h", "*.hpp",
    "*.java", "*.kdl", "*.md", "*.ps1", "*.py", "*.r", "*.rs", "*.s", "*.sh", "*.zig",
  },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.css", "*.hs", "*.html", "*.ipynb", "*.js", "*.json", "*.jsx",
    "*.lua", "*.nix", "*.rb", "*.svelte", "*.ts", "*.tsx", "*.xml",
  },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.md" },
  callback = function()
    vim.cmd("silent! Markview splitToggle")
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.md", "*.txt", "*.tex" },
  callback = function()
    vim.opt.textwidth = 80
  end,
})
