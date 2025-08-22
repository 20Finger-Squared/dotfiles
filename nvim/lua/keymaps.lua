local opts = { noremap = true, silent = true }

--move highlighted stuffs
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Optional: delete to blackhole to avoid overwriting clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts) -- Delete without affecting registers

-- Add more keymaps below as needed
-- Save current file with <leader>w
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", opts)

-- Quit current window with <leader>q
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", opts)

vim.keymap.set("n", "<C-;>", ":", { desc = "Enter command mode" })
vim.keymap.set("v", "<C-;>", ":", { desc = "Enter command mode (visual)" })
vim.keymap.set("t", "<C-;>", "<C-\\><C-n>:", { desc = "Exit terminal and enter command mode" })

-- Move split positions
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to right" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to top" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to bottom" })

vim.keymap.set("t", "<C-S-h>", "<C-\\><C-n><C-w>H", { desc = "Move window to left (terminal)" })
vim.keymap.set("t", "<C-S-l>", "<C-\\><C-n><C-w>L", { desc = "Move window to right (terminal)" })
vim.keymap.set("t", "<C-S-k>", "<C-\\><C-n><C-w>K", { desc = "Move window to top (terminal)" })
vim.keymap.set("t", "<C-S-j>", "<C-\\><C-n><C-w>J", { desc = "Move window to bottom (terminal)" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left split from terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to below split from terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to above split from terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right split from terminal" })
vim.keymap.set("n", "<leader>t", "<cmd>lua toggle_bottom_term()<CR>", { desc = "Toggle bottom terminal" })

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
vim.keymap.set("n", "<leader>re", builtin.registers, { desc = "Registers" })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Find files' })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add current file
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon Add File" })

-- Toggle Harpoon UI
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { desc = "Harpoon Menu" })

-- Navigate to files 1–4
vim.keymap.set("n", "<leader>1", ui.navfile(1), { desc = "Harpoon File 1" })
vim.keymap.set("n", "<leader>2", ui.navfile(2), { desc = "Harpoon File 2" })
vim.keymap.set("n", "<leader>3", ui.navfile(3), { desc = "Harpoon File 3" })
vim.keymap.set("n", "<leader>4", ui.navfile(4), { desc = "Harpoon File 4" })
