local lsp = require('lspconfig')
local util = require('lspconfig/util')

lsp.intelephense.setup({
  on_attach = require('lsp.on_attach'),
  filetypes = { "php", "blade" },
  settings = {
    intelephense = {
      environment = {
        includePaths = { "./vendor" }
      },
      files = {
        maxSize = 5000000
      }
    }
  }
})
