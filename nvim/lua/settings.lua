local opt = vim.opt

-- Neovide settings
vim.opt.showmode = false
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.neovide_hide_titlebar = true
vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00
vim.g.neovide_scale_factor = 1.3
vim.opt.termguicolors = true

opt.swapfile = false
opt.undofile = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.updatetime = 3000
opt.timeoutlen = 5000
opt.number = true
opt.relativenumber = true

-- folding
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- These are the key settings you're missing:
opt.foldlevel = 99      -- Start with all folds open
opt.foldlevelstart = 99 -- Always start with all folds open
opt.foldenable = true   -- Enable folding
opt.foldcolumn = "auto"
