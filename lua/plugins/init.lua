return {
    require("plugins.lazy"),         -- Lazy.nvim (Plugin Manager)
    require("plugins.tokyonight"),   -- Tokyo Night (Farbschema)
    require("plugins.catppuccin"),   -- Catppuccin (Farbschema)
    require("plugins.nvim-tree"),    -- NvimTree (Datei-Explorer)
    require("plugins.telescope"),    -- Telescope (Fuzzy Finder)
    require("plugins.treesitter"),   -- Treesitter (Syntax-Highlighting)
    require("plugins.mason"),
    require("plugins.mason-lsp"),
    require("plugins.lsp"),          -- LSP (Language Server)
    require("plugins.cmp"),          -- Nvim-CMP (Autocompletion)
    require("plugins.cmp-nvim-lsp"), -- Integrates nvim-cmp with LSP capabilities
    require("plugins.luasnip"),      -- Luasnippet (Snippets)
    require("plugins.autopairs"),
}

