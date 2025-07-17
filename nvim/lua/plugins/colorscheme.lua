return {
  "Mofiqul/dracula.nvim",
  config = function()
    require("dracula").setup({
      colors = {
        bg = "#000000",  -- pure black background
        black = "#000000",  -- also override the "black" color
      },
    })
    vim.cmd.colorscheme("dracula")
  end,
}
