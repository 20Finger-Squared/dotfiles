return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,         -- makes sure it loads before other plugins
    config = function()
      vim.cmd.colorscheme("dracula")
    end,
  },
}
