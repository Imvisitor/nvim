local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Explorer öffnen
map("n", "<leader>pv", ":NvimTreeToggle<CR>", opts)

-- Fuzzy Finder
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)

-- Git Status
map("n", "<leader>gs", ":Telescope git_status<CR>", opts)

-- ChatGPT öffnen
map("n", "<leader>cg", ":ChatGPT<CR>", opts)
