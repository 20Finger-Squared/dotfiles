-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Toggle nvim-tree with <leader>e
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Close current window with <leader>q
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)

-- System clipboard yanking
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)  -- Yank to system clipboard
vim.keymap.set("n", "<leader>Y", '"+yy', opts)          -- Yank entire line to clipboard

-- System clipboard pasting
vim.keymap.set("n", "<leader>p", '"+p', opts)           -- Paste after cursor
vim.keymap.set("n", "<leader>P", '"+P', opts)           -- Paste before cursor

-- Optional: delete to blackhole to avoid overwriting clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)  -- Delete without affecting registers

-- Add more keymaps below as needed
-- Save current file with <leader>w
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { noremap = true, silent = true })

-- Quit current window with <leader>q
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { noremap = true, silent = true })

-- Open a vertical split + start a terminal with <leader>t
vim.keymap.set("n", "<leader>t", "<cmd>vsplit | terminal<CR>", { noremap = true, silent = true })

-- Terminal mode: Ctrl+q or Ctrl+l to switch to Normal mode
vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], { desc = "Terminal -> Normal mode (Ctrl+q)" })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n>]], { desc = "Terminal -> Normal mode (Ctrl+l)" })
