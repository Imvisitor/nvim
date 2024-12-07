local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Safe load of nvimtree_utils
local status, nvimtree_utils = pcall(require, "scripts.nvimtree_utils")
if not status then
  vim.notify("Failed to load nvimtree_utils.lua", vim.log.levels.ERROR)
  return
end

-- Keymaps for Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Toggle file explorer
map("n", "<leader>er", function() nvimtree_utils.change_nvim_tree_root() end, opts) -- Dynamically change the root folder
map("n", "<leader>ec", function() nvimtree_utils.collapse_all() end, opts) -- Collapse all folders
map("n", "<leader>ef", function() nvimtree_utils.focus_current_file() end, opts) -- Focus on the current file
map("n", "<leader>eh", function()
  require("nvim-tree.api").tree.toggle_help()
end, opts)

-- Fuzzy Finder (Telescope)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- Search text
map("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Show open buffers
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- Search help tags

-- Git Integration
map("n", "<leader>gs", ":Telescope git_status<CR>", opts) -- Show Git status
map("n", "<leader>gc", ":Telescope git_commits<CR>", opts) -- Browse Git commits

-- LSP Functions
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) -- Go to implementation
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- Show references
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts) -- Show documentation
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts) -- Rename symbol
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) -- Code action
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts) -- Jump to next diagnostic
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts) -- Jump to previous diagnostic

-- Snippets
map("i", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", opts) -- Expand or jump in snippet
map("s", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", opts)
map("i", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", opts) -- Jump back in snippet
map("s", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", opts)

-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts) -- Move to the left window
map("n", "<C-l>", "<C-w>l", opts) -- Move to the right window
map("n", "<C-j>", "<C-w>j", opts) -- Move to the window below
map("n", "<C-k>", "<C-w>k", opts) -- Move to the window above

-- Tabs
map("n", "<leader>tn", ":lua require('scripts.newtabwithfile').open_tab_with_file()<CR>", opts) -- Open a new tab with optional file 
map("n", "<leader>tc", ":tabclose<CR>", opts) -- Close the current tab
map("n", "<leader>to", ":tabonly<CR>", opts) -- Close all other tabs
map("n", "<leader>tp", ":tabprevious<CR>", opts) -- Go to the previous tab
map("n", "<leader>tx", ":tabnext<CR>", opts) -- Go to the next tab

-- Buffers
map("n", "<leader>bd", ":bdelete<CR>", opts) -- Delete current buffer
map("n", "<leader>bn", ":bnext<CR>", opts) -- Go to the next buffer
map("n", "<leader>bp", ":bprevious<CR>", opts) -- Go to the previous buffer

-- Terminal
map("n", "<leader>tt", ":split | terminal<CR>", opts) -- Open terminal in a horizontal split
map("n", "<leader>tv", ":vsplit | terminal<CR>", opts) -- Open terminal in a vertical split

-- Execute Code
map("n", "<leader>rp", ":lua require('scripts.run_python').run_python_file()<CR>", opts) -- Run Python
map("n", "<leader>rc", ":lua require('scripts.run_c').run_c_file()<CR>", opts) -- Run C
map("n", "<leader>rl", ":lua require('scripts.run_lua').run_lua_file()<CR>", opts) -- Run Lua
map("n", "<leader>rj", ":lua require('scripts.run_java').run_java_file()<CR>", opts) -- Run Java

