local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Safe load of nvimtree_utils
local status, nvimtree_utils = pcall(require, "scripts.nvimtree_utils")
if not status then
  vim.notify("Failed to load nvimtree_utils.lua", vim.log.levels.ERROR)
  return
end

-- Keymaps for Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle file explorer" }))
map("n", "<leader>er", function() nvimtree_utils.change_nvim_tree_root() end, vim.tbl_extend("force", opts, { desc = "Change NvimTree root" }))
map("n", "<leader>ec", function() nvimtree_utils.collapse_all() end, vim.tbl_extend("force", opts, { desc = "Collapse all folders" }))
map("n", "<leader>ef", function() nvimtree_utils.focus_current_file() end, vim.tbl_extend("force", opts, { desc = "Focus on current file" }))
map("n", "<leader>eh", function() require("nvim-tree.api").tree.toggle_help() end, vim.tbl_extend("force", opts, { desc = "Toggle NvimTree help" }))

-- Fuzzy Finder (Telescope)
map("n", "<leader>ff", ":Telescope find_files<CR>", vim.tbl_extend("force", opts, { desc = "Find files" }))
map("n", "<leader>fg", ":Telescope live_grep<CR>", vim.tbl_extend("force", opts, { desc = "Search text" }))
map("n", "<leader>fb", ":Telescope buffers<CR>", vim.tbl_extend("force", opts, { desc = "Show open buffers" }))
map("n", "<leader>fh", ":Telescope help_tags<CR>", vim.tbl_extend("force", opts, { desc = "Search help tags" }))

-- Git Integration
map("n", "<leader>gs", ":Telescope git_status<CR>", vim.tbl_extend("force", opts, { desc = "Show Git status" }))
map("n", "<leader>gc", ":Telescope git_commits<CR>", vim.tbl_extend("force", opts, { desc = "Browse Git commits" }))

-- LSP Functions
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", vim.tbl_extend("force", opts, { desc = "Go to definition" }))
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", vim.tbl_extend("force", opts, { desc = "Show references" }))
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", vim.tbl_extend("force", opts, { desc = "Show documentation" }))
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", vim.tbl_extend("force", opts, { desc = "Code action" }))
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", vim.tbl_extend("force", opts, { desc = "Jump to next diagnostic" }))
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", vim.tbl_extend("force", opts, { desc = "Jump to previous diagnostic" }))

-- Snippets
map("i", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", vim.tbl_extend("force", opts, { desc = "Expand or jump in snippet" }))
map("s", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", vim.tbl_extend("force", opts, { desc = "Expand or jump in snippet" }))
map("i", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", vim.tbl_extend("force", opts, { desc = "Jump back in snippet" }))
map("s", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", vim.tbl_extend("force", opts, { desc = "Jump back in snippet" }))

-- Window Navigation
map("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Move to the left window" }))
map("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Move to the right window" }))
map("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Move to the window below" }))
map("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Move to the window above" }))

-- Tabs
map("n", "<leader>tn", ":lua require('scripts.newtabwithfile').open_tab_with_file()<CR>", vim.tbl_extend("force", opts, { desc = "Open a new tab with optional file" }))
map("n", "<leader>tc", ":tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close the current tab" }))
map("n", "<leader>to", ":tabonly<CR>", vim.tbl_extend("force", opts, { desc = "Close all other tabs" }))
map("n", "<leader>tp", ":tabprevious<CR>", vim.tbl_extend("force", opts, { desc = "Go to the previous tab" }))
map("n", "<leader>tx", ":tabnext<CR>", vim.tbl_extend("force", opts, { desc = "Go to the next tab" }))

-- Buffers
map("n", "<leader>bd", ":bdelete<CR>", vim.tbl_extend("force", opts, { desc = "Delete current buffer" }))
map("n", "<leader>bn", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Go to the next buffer" }))
map("n", "<leader>bp", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Go to the previous buffer" }))

-- TODO Mode Keymaps
map("n", "<leader>td", ":TodoQuickFix<CR>", vim.tbl_extend("force", opts, { desc = "Open TODOs in quickfix" }))
map("n", "<leader>tt", ":TodoTelescope<CR>", vim.tbl_extend("force", opts, { desc = "Search TODOs with Telescope" }))
map("n", "<leader>tl", ":TodoLocList<CR>", vim.tbl_extend("force", opts, { desc = "Open TODOs in location list" }))

-- Peek
map("n", "<leader>po", ":PeekOpen<CR>", vim.tbl_extend("force", opts, { desc = "Open preview window" }))
map("n", "<leader>pc", ":PeekClose<CR>", vim.tbl_extend("force", opts, { desc = "Close preview window" }))

-- Harpoon
map("n", "<leader>a", mark.add_file, vim.tbl_extend("force", opts, { desc = "Add file to Harpoon" }))
map("n", "<leader>h", ui.toggle_quick_menu, vim.tbl_extend("force", opts, { desc = "Toggle Harpoon menu" }))
map("n", "<leader>1", function() ui.nav_file(1) end, vim.tbl_extend("force", opts, { desc = "Navigate to file 1" }))
map("n", "<leader>2", function() ui.nav_file(2) end, vim.tbl_extend("force", opts, { desc = "Navigate to file 2" }))
map("n", "<leader>3", function() ui.nav_file(3) end, vim.tbl_extend("force", opts, { desc = "Navigate to file 3" }))
map("n", "<leader>4", function() ui.nav_file(4) end, vim.tbl_extend("force", opts, { desc = "Navigate to file 4" }))

