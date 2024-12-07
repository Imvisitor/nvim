return {
  'hrsh7th/cmp-nvim-lsp',
  requires = 'neovim/nvim-lspconfig',  
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    lspconfig.pyright.setup {
      capabilities = capabilities,
    }
  end,
}

