-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<F2>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFindFile<CR>")
local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 80
local height = 40
-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                width = width,
                height = height,
                row = (gheight - height) * 0.4,
                col = (gwidth - width) * 0.5,
            }
        }
    },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "U",
                    staged = "S",
                    unmerged = "UM",
                    renamed = "R",
                    untracked = "N",
                    deleted = "D",
                    ignored = "I",
                },
            },
        },
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
