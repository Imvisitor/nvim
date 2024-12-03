return {
    "kyazdani42/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
            },
        })
    end,
}
