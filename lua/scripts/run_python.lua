local M = {}

-- Function to run the current Python file
M.run_python_file = function()
    -- Get the absolute path of the current file
    local file_path = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(file_path, ":h")

    -- Ensure the file is a Python file
    if not file_path:match("%.py$") then
        print("Error: Current file is not a Python script.")
        return
    end

    -- Open a new terminal and execute the Python file
    vim.cmd("split | terminal python3 " .. file_path)
end

return M

