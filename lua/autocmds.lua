vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.py",
    callback = function() vim.cmd("set filetype=python") end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.c",
    callback = function() vim.cmd("set filetype=c") end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.tex",
    callback = function() vim.cmd("set filetype=tex") end,
})

