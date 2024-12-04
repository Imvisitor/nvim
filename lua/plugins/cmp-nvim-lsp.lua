return {
    "hrsh7th/cmp-nvim-lsp", -- Integrates nvim-cmp with LSP capabilities
    requires = { "hrsh7th/nvim-cmp" }, -- Ensure nvim-cmp is a dependency
    config = function()
        -- Example setup for nvim-cmp with LSP source
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- You can replace `vsnip` with `luasnip` or another snippet engine
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- Use LSP as a source
            }),
        })
    end,
}
