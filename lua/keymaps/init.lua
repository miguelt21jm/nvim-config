
-- Set leader key
vim.g.mapleader = " " -- Space as the leader key
vim.g.maplocalleader = " " -- Optional: Local leader key

-- Utility function for setting keymaps
local function map(mode, lhs, rhs, opts)
  local options = opts or {}
  vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "kj", "<Esc>", { desc = "Exit insert mode" })
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
