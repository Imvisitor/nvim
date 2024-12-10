return {
     "hrsh7th/nvim-cmp", config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- LuaSnip integration
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(), -- Trigger autocomplete
                ["<C-e>"] = cmp.mapping.abort(),        -- Abort autocomplete
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP source
                { name = "luasnip" }, -- Snippet source
            }),
        })
    end,
}

