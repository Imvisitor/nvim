return {
  "mbbill/undotree",
  config = function()
    -- Keybinding to toggle the UndoTree window
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })

    -- Optional: Customize undotree behavior
    vim.g.undotree_WindowLayout = 2       -- Set the layout: 2 = vertical split
    vim.g.undotree_ShortIndicators = 1   -- Use short indicators for nodes
    vim.g.undotree_SetFocusWhenToggle = 1 -- Focus the window when toggled

    -- Persistent undo setup (corrected)
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir") -- Ensure undodir is a string

    -- Create the directory if it does not exist
    local undodir_path = vim.fn.expand("~/.config/nvim/undodir")
    if vim.fn.isdirectory(undodir_path) == 0 then
      vim.fn.mkdir(undodir_path, "p")
    end
  end
}

