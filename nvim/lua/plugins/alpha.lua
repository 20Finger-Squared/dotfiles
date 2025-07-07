
return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = vim.split([[
             ___                                       
            /\_ \    __                 __             
   __    ___\//\ \  /\_\  _____   __  _/\_\     __     
 /'__`\ /'___\\ \ \ \/\ \/\ '__`\/\ \/'\/\ \  /'__`\   
/\  __//\ \__/ \_\ \_\ \ \ \ \L\ \/>  </\ \ \/\ \L\.\_ 
\ \____\ \____\/\____\\ \_\ \ ,__/\_/\_\\ \_\ \__/.\_\
 \/____/\/____/\/____/ \/_/\ \ \/ \//\/_/ \/_/\/__/\/_/
                            \ \_\                      
                             \/_/                      
]], "\n")

      dashboard.section.buttons.val = {
  dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),
  dashboard.button("t", "  Open terminal", ":vsplit | terminal<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),      }

      alpha.setup(dashboard.opts)
    end,
  },
}
