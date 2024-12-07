return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Gemeinsame on_attach Funktion
        local on_attach = function(client, bufnr)
            -- Beispiel: Mapping der `gd` (go to definition) in diesem Buffer
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
        end

        -- Liste der LSP-Server, die du einrichten möchtest
        local servers = { 'pyright', 'clangd', 'texlab' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            -- Server-spezifische Optionen können hier hinzugefügt werden
          }
        end
    end,
}

