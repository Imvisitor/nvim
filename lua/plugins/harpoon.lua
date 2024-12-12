return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 20,
            },
        })

        require("telescope").load_extension("harpoon")
    end,
}
