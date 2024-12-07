-- Define the module
local M = {}

-- Function to open a new tab with an optional file
M.open_tab_with_file = function()
    -- Prompt the user for a file name
    local filename = vim.fn.input("File name (leave blank for new tab): ")
    if filename and filename ~= "" then
        -- Open the specified file in a new tab
        vim.cmd("tabnew " .. filename)
    else
        -- Open an empty tab if no file name is provided
        vim.cmd("tabnew")
    end
end

-- Return the module for external use
return M

