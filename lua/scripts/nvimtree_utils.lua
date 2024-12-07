local M = {}

-- Function to change the root folder and refresh nvim-tree
function M.change_nvim_tree_root()
  local current_file = vim.fn.expand("%:p:h")
  if current_file == "" or not vim.fn.isdirectory(current_file) then
    vim.notify("Unable to set root: not a valid directory", vim.log.levels.ERROR)
    return
  end

  local nvim_tree_api = require("nvim-tree.api")
  nvim_tree_api.tree.change_root(current_file) 
  nvim_tree_api.tree.reload()

  vim.notify("Root set to: " .. current_file, vim.log.levels.INFO)
end

-- Function to set a predefined folder as the root
function M.set_start_folder(folder)
  vim.cmd("cd " .. folder)
  vim.cmd("NvimTreeRefresh")
  print("Root folder changed to: " .. folder)
end

-- Function to collapse all folders in nvim-tree
function M.collapse_all()
  vim.cmd("NvimTreeCollapse")
  print("All folders collapsed.")
end

-- Function to focus on the current file in nvim-tree
function M.focus_current_file()
  vim.cmd("NvimTreeFindFile")
  print("Focused on the current file.")
end

return M

