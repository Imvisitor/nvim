return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "c", "lua", "latex" },
            highlight = {
                enable = true,
            },
        })
    end,
}
