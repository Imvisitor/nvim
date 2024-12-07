return {
    "neovim/nvim-lspconfig", 
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local servers = {
            java = "jdtls",
            c = "clangd",
            python = "pyright",
            lua = "lua_ls",
            latex = "texlab",
        }

        -- Setup für jeden Server
        for _, server in pairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = function(_, _) end,
            })
        end
    end,
}
