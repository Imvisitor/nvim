-- Leader Key setzen
vim.g.mapleader = " "

-- Lazy.nvim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins laden
require("lazy").setup("plugins")

-- Basis-Module laden
require("settings")
require("keymaps")
require("autocmds")
require("theme")
