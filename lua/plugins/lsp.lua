return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Liste der LSP-Server, die du einrichten möchtest
        local servers = { 'pyright', 'clangd', 'texlab' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            capabilities = capabilities
          }
        end
    end,
}

