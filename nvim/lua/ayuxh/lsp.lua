local lsp = require('lsp-zero').preset({})

require('lspconfig').clangd.setup({
  single_file_support = true,
  on_attach = function(client, bufnr)
    print('hello clangd')
  end
})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'},
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    -- ['null-ls'] = {'javascript', 'typescript'},
  }
})

function bemol()
 local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
 local ws_folders_lsp = {}
 if bemol_dir then
  local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
  if file then

   for line in file:lines() do
    table.insert(ws_folders_lsp, line)
   end
   file:close()
  end
 end

 for _, line in ipairs(ws_folders_lsp) do
  vim.lsp.buf.add_workspace_folder(line)
 end
end
bemol()

lsp.setup()
