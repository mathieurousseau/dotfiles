return {
  'kevinhwang91/nvim-ufo',
  event = 'VeryLazy',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = vim.lsp.get_clients()
    for _, ls in ipairs(language_servers) do
      vim.lsp.config(ls, {
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
      })
    end
    require('ufo').setup()
  end
}
