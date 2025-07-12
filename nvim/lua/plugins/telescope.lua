return {
  'nvim-telescope/telescope.nvim',
	branch = "master",
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for Telescope
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- You need to build this plugin.
      -- Use 'make' for Linux/macOS, or 'cmake' for Windows.
      -- The 'build' key in lazy.nvim ensures it's compiled on installation.
      build = 'make', -- For Linux/macOS
      -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release', -- For Windows
      config = function()
        -- Load the fzf extension for Telescope
        require('telescope').load_extension('fzf')
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        -- You can customize default settings here
        -- For example, to adjust the preview window
        -- preview = {
        --   patterns = {
        --     ['.*'] = { 'bat', '--color=always', '--style=numbers' }, -- Use bat for preview if installed
        --   },
        -- },
        -- mappings = {
        --   i = {
        --     ['<C-u>'] = actions.preview_scrolling_up,
        --     ['<C-d>'] = actions.preview_scrolling_down,
        --   },
        -- },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- "smart_case", "ignore_case", or "respect_case"
        }
      }
    })

    -- Optional: Define keymaps for common Telescope pickers
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
  end,
}
