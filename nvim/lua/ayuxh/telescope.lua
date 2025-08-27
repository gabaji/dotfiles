local builtin = require('telescope.builtin')
function project_search()
  builtin.find_files {
    previewer = false,
    shorten_path = true,
    layout_strategy = "vertical",
  }
end
function find_references()
  builtin.lsp_references {
    layout_strategy = "vertical",
  }
end

vim.keymap.set('n', '<leader>ff', project_search, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', find_references)
