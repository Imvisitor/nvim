local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local cmp = require('cmp')


-- Esc -> CapsLock
--map("i", "<CapsLock>", "<Esc>", opts) -- Funktioniert noch nicht: CapsLock gibt es nicht

-- Run Code  
map("n", "<leader>rp", ":lua vim.cmd('!python3 ' .. vim.fn.expand('%'))<CR>", opts) -- Run Python File
map("n", "<leader>rc", ":lua vim.cmd('!gcc -o ' .. vim.fn.expand('%:r') .. ' ' .. vim.fn.expand('%') .. ' -Wall -Wextra -Werror -pedantic -std=c11 && ./' .. vim.fn.expand('%:r'))<CR>", opts) -- Run C File

-- Explorer öffnen
map("n", "<leader>pv", ":NvimTreeToggle<CR>", opts)

-- Fuzzy Finder
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- Inhalte durchsuchen
map("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Geöffnete Buffers anzeigen
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- Hilfe durchsuchen

-- Git Status
map("n", "<leader>gs", ":Telescope git_status<CR>", opts)
map("n", "<leader>gc", ":Telescope git_commits<CR>", opts) -- Git Commits durchsuchen<D-a>


-- LSP-Funktionen
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Gehe zur Definition
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) -- Gehe zur Implementierung
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) -- Zeige Referenzen
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts) -- Dokumentation anzeigen
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts) -- Umbenennen
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) -- Code-Aktion
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts) -- Nächster Fehler

-- Snippets
map("i", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", opts) -- Snippet expandieren oder springen
map("s", "<C-k>", ":lua require'luasnip'.expand_or_jump()<CR>", opts)
map("i", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", opts) -- Zum vorherigen Snippet springen
map("s", "<C-j>", ":lua require'luasnip'.jump(-1)<CR>", opts)

-- Fenster-Navigation
map("n", "<C-h>", "<C-w>h", opts) -- Zum linken Fenster
map("n", "<C-l>", "<C-w>l", opts) -- Zum rechten Fenster
map("n", "<C-j>", "<C-w>j", opts) -- Zum unteren Fenster
map("n", "<C-k>", "<C-w>k", opts) -- Zum oberen Fenster

-- Tabs
map("n", "<leader>tn", ":tabnew<CR>", opts) -- Neues Tab öffnen
map("n", "<leader>tc", ":tabclose<CR>", opts) -- Tab schließen
map("n", "<leader>to", ":tabonly<CR>", opts) -- Alle anderen Tabs schließen
map("n", "<leader>tp", ":tabprevious<CR>", opts) -- Zum vorherigen Tabb
map("n", "<leader>tx", ":tabnext<CR>", opts) -- Zum nächsten Tab

-- Buffers
map("n", "<leader>bd", ":bdelete<CR>", opts) -- Buffer löschen
map("n", "<leader>bn", ":bnext<CR>", opts) -- Nächsten Buffer öffnen
map("n", "<leader>bp", ":bprevious<CR>", opts) -- Vorherigen Buffer öffnen

-- Schnell speichern und schließen
map("n", "<leader>w", ":w<CR>", opts) -- Speichern
map("n", "<leader>q", ":q<CR>", opts) -- Schließen
map("n", "<leader>wq", ":wq<CR>", opts) -- Speichern und Schließen

-- Terminal
map("n", "<leader>tt", ":split | terminal<CR>", opts) -- Terminal in Split öffnen
map("n", "<leader>tv", ":vsplit | terminal<CR>", opts) -- Terminal in vertikalem Split öffnen

