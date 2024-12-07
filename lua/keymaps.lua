local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tabs: Open, close, and navigate between tabs
local function open_tab_with_file()
    local filename = vim.fn.input("File name: ")
    if filename ~= "" then
        vim.cmd("tabnew " .. filename)
    else
        vim.cmd("tabnew") -- Open an empty tab if no file is provided
    end
end

map("n", "<leader>tn", open_tab_with_file, { desc = "Open a new tab with a file" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", opts) -- Close current tab
map("n", "<leader>tx", "<cmd>tabnext<CR>", opts)  -- Go to the next tab

-- Fuzzy Finder (Telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search text" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Switch buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })

-- LSP: Keymaps for language server features
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- Split navigation
map("n", "<C-h>", "<C-w>h", opts) -- Move left
map("n", "<C-l>", "<C-w>l", opts) -- Move right
map("n", "<C-j>", "<C-w>j", opts) -- Move down
map("n", "<C-k>", "<C-w>k", opts) -- Move up
