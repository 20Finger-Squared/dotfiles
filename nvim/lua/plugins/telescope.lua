return {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    dependencies = {
        'nvim-lua/plenary.nvim', -- Required for Telescope
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make', -- For Linux/macOS
            config = function()
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
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-h>"] = "preview_scrolling_left",
                        ["<C-l>"] = "preview_scrolling_right",
                    },
                    n = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-h>"] = "preview_scrolling_left",
                        ["<C-l>"] = "preview_scrolling_right",
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["d"] = actions.delete_buffer,
                        },
                        n = {
                            ["d"] = actions.delete_buffer,
                        },
                    },
                },

            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        })
    end,
}
