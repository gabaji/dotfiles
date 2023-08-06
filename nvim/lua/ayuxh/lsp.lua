local lsp = require('lsp-zero').preset({})

require('lspconfig').clangd.setup({
  single_file_support = true,
  on_attach = function(client, bufnr)
    print('hello clangd')
  end
})

lsp.setup()

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


lsp.setup()
