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

-- Helper to load plugin specs from lua/plugins/*.lua
local function load_plugins()
    local plugins = {}
    local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins"
    for _, file in ipairs(vim.fn.readdir(plugin_path, [[v:val =~ '\.lua$']])) do
        -- Skip lazy.lua itself
        if file ~= "lazy.lua" then
            local spec = require("plugins." .. file:gsub("%.lua$", ""))
            if type(spec) == "table" then
                for _, plugin in ipairs(spec) do
                    table.insert(plugins, plugin)
                end
            end
        end
    end
    return plugins
end

-- Return the loaded plugin specs to Lazy.nvim
require("lazy").setup(load_plugins())

