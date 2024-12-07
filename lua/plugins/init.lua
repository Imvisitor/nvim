return {
    -- Plugin Manager
    { "folke/lazy.nvim" },         -- Lazy.nvim: Manages plugins dynamically

    -- Themes and UI
    { "folke/tokyonight.nvim" },   -- Tokyo Night colorscheme
    { "catppuccin/nvim" },         -- Catppuccin colorscheme

    -- File Navigation
    { "kyazdani42/nvim-tree.lua", config = function()
        require("nvim-tree").setup()
    end },

    -- Fuzzy Finder
    { "nvim-telescope/telescope.nvim", config = function()
        require("telescope").setup()
    end },

    -- Syntax Highlighting
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

    -- LSP and Completion
    { "neovim/nvim-lspconfig" },   -- LSP Configuration
    { "williamboman/mason.nvim", config = function()
        require("mason").setup()
    end },
    { "hrsh7th/nvim-cmp", config = function()
        require("cmp").setup()
    end },
    { "L3MON4D3/LuaSnip" },        -- Snippet Engine

    -- Other Utilities
    { "folke/which-key.nvim", config = function()
        require("which-key").setup()
    end }
}
