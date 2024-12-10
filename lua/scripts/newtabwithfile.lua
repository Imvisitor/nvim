-- Define the module
local M = {}

-- Function to open a new tab with an optional file
M.open_tab_with_file = function()
    -- Get the current working directory
    local cwd = vim.fn.getcwd()

    -- Prompt the user for a file name with completion
    vim.ui.input({
        prompt = "File name (leave blank for new tab): ",
        completion = "file", -- Enable file name tab-completion
    }, function(filename)
        if filename and filename ~= "" then
            -- Open the specified file in a new tab
            vim.cmd("tabnew " .. cwd .. "/" .. filename)
        else
            -- Open an empty tab if no file name is provided
            vim.cmd("tabnew")
        end
    end)
end

-- Return the module for external use
return M


