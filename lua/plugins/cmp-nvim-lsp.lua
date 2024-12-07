return {
    "hrsh7th/cmp-nvim-lsp", -- LSP integration for nvim-cmp
    dependencies = { "neovim/nvim-lspconfig" }, -- Ensure nvim-lspconfig is available
    config = function()
        require("cmp_nvim_lsp").default_capabilities()
    end,
}

