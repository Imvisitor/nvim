return {
    "williamboman/mason-lspconfig.nvim",
    requires = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    config = function()
        require("mason-lspconfig").setup({
            -- Auto-install LSPs list here, or you can leave it to configure manually
            ensure_installed = { "pyright", "clangd", "texlab" },
            automatic_installation = true,  -- Automatically install LSPs that are set up via lspconfig but not installed
        })
    end,
}

