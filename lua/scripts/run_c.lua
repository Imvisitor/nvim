local M = {}

-- Function to find and compile a C file with int main() or int main(void)
M.run_c_file = function()
    -- Get the directory of the currently open file
    local current_file = vim.fn.expand("%:p")
    local current_dir = vim.fn.fnamemodify(current_file, ":h")

    -- Find a C file in the current directory with "int main()" or "int main(void)"
    local c_file_with_main = nil
    local c_files = {}
    for _, file in ipairs(vim.fn.readdir(current_dir)) do
        if file:match("%.c$") then
            local file_path = current_dir .. "/" .. file
            table.insert(c_files, file_path)
            local has_main = vim.fn.systemlist("grep -Eq 'int main\\(\\)|int main\\(void\\)' " .. file_path .. " && echo 'yes' || echo 'no'")[1]
            if has_main == "yes" then
                c_file_with_main = file_path
            end
        end
    end

    -- If no C file with int main() or int main(void) is found, print an error and return
    if not c_file_with_main then
        print("Error: No C file with 'int main()' or 'int main(void)' found in the current directory.")
        return
    end

    -- Compile and run the C file
    local executable = c_file_with_main:gsub("%.c$", "")
    local compile_command = "gcc -o " .. executable .. " " .. table.concat(c_files, " ")
    vim.cmd("split | terminal " .. compile_command .. " && ./" .. executable)
end

return M

