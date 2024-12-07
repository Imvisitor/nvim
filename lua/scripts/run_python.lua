local M = {}

-- Function to run a Python file
M.run_python_file = function()
    -- Get the current file path
    local file_path = vim.fn.expand("%:p")
    
    -- Ensure the file is a Python file
    if not file_path:match("%.py$") then
        print("Error: Current file is not a Python script.")
        return
    end

    -- Open a new terminal and execute the Python file
    vim.cmd("split | terminal python3 " .. file_path)
end

return M

