return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({})  -- Python
        lspconfig.clangd.setup({})   -- C/C++
        lspconfig.texlab.setup({})   -- LaTeX
    end,
}
