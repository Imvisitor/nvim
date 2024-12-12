return {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {
            -- Add your configuration here if needed
        }
    end
}

