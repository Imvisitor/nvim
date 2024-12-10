local M = {}

-- Function to find, compile, and run a Java file with "public static void main(String[] args)"
M.run_java_file = function()
    -- Get the directory of the currently open file
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")

    -- Find a Java file in the current directory with "public static void main(String[] args)"
    local java_file_with_main = nil
    for _, file in ipairs(vim.fn.readdir(current_dir)) do
        if file:match("%.java$") then
            local file_path = current_dir .. "/" .. file
            local has_main = vim.fn.systemlist("grep -q 'public static void main(String[] args)' " .. file_path .. " && echo 'yes' or echo 'no'")[1]
            if has_main == "yes" then
                java_file_with_main = file_path
                break
            end
        end
    end

    -- If no Java file with main() is found, print an error and return
    if not java_file_with_main then
        print("Error: No Java file with 'public static void main(String[] args)' found in the current directory.")
        return
    end

    -- Compile and run the Java file
    local class_name = java_file_with_main:match("([^/]+)%.java$")
    vim.cmd("split | terminal javac " .. java_file_with_main .. " && java -cp " .. current_dir .. " " .. class_name)
end

return M

