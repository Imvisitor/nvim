-- Set leader key (used for custom keybindings)
vim.g.mapleader = " "

-- Lazy.nvim Setup: Dynamically loads plugins
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
vim.opt.rtp:prepend(lazypath) -- Add Lazy.nvim to the runtime path

-- Load plugins and essential modules
require("lazy").setup("plugins") -- Plugin initialization
require("settings")  -- Load basic settings
require("keymaps")   -- Load keymaps
require("autocmds")  -- Load auto commands
require("theme")     -- Load theme configuration
