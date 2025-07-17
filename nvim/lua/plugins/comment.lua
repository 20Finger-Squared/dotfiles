return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup()
      vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
      vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
      vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
      vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
    end
  },

  -- Comment.nvim with <Space>/ keymap
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()

      -- Normal mode: <Space>/ to toggle comment
      vim.keymap.set('n', '<leader>/', function()
        require('Comment.api').toggle.linewise.current()
      end, { desc = "Toggle comment line" })

      -- Visual mode: <Space>/ to toggle comment on selection
      vim.keymap.set('v', '<leader>/', function()
        local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'nx', false)
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
      end, { desc = "Toggle comment block" })
    end
  },
}
