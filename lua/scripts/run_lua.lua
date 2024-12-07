local M = {}

-- Function to find and execute a Lua file with "function main()"
M.run_lua_file = function()
    -- Get the directory of the currently open file
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")

    -- Find a Lua file in the current directory with "function main()"
    local lua_file_with_main = nil
    for _, file in ipairs(vim.fn.readdir(current_dir)) do
        if file:match("%.lua$") then
            local file_path = current_dir .. "/" .. file
            local has_main = vim.fn.systemlist("grep -q 'function main' " .. file_path .. " && echo 'yes' or echo 'no'")[1]
            if has_main == "yes" then
                lua_file_with_main = file_path
                break
            end
        end
    end

    -- If no Lua file with function main() is found, print an error and return
    if not lua_file_with_main then
        print("Error: No Lua file with 'function main()' found in the current directory.")
        return
    end

    -- Execute the Lua file
    vim.cmd("split | terminal lua " .. lua_file_with_main)
end

return M

