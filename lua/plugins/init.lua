local plugins = {}

-- Helper to load all plugin files from lua/plugins/*.lua
local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(plugin_path, [[v:val =~ '\.lua$']])) do
    if file ~= "init.lua" then
        local spec = require("plugins." .. file:gsub("%.lua$", ""))
        if type(spec) == "table" then
            for _, plugin in ipairs(spec) do
                table.insert(plugins, plugin)
            end
        end
    end
end

return plugins

