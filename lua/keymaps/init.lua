------------------------------ HELPERS
local function toggle_full_focus()
  -- use a window-scoped var so each win can remember its own state
  local is_zoomed = vim.w.zoomed or false

  if is_zoomed then
    -- restore equal splits
    vim.cmd("wincmd =")
    vim.w.zoomed = false
  else
    -- maximize current win
    vim.cmd("wincmd _")
    vim.cmd("wincmd |")
    vim.w.zoomed = true
  end
end

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
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from system clipboard into selection" })

-- Window management
map("n", "<leader>wv", ":vsplit<CR>",              { desc = "Vertical split" })
map("n", "<leader>ws", ":split<CR>",               { desc = "Horizontal split" })
map("n", "<leader>wo", "<C-w>o",                   { desc = "Close other windows" })
map("n", "<leader>w=", "<C-w>=",                   { desc = "Equalize window sizes" })

vim.keymap.set(
  "n",
  "<leader>wf",
  toggle_full_focus,
  { desc = "Toggle full focus for current window" }
)

-- Window navigation
map("n", "<leader>wh", "<C-w>h",                   { desc = "Move to left window" })
map("n", "<leader>wj", "<C-w>j",                   { desc = "Move to bottom window" })
map("n", "<leader>wk", "<C-w>k",                   { desc = "Move to top window" })
map("n", "<leader>wl", "<C-w>l",                   { desc = "Move to right window" })

-- Window resizing
map("n", "<leader><Left>",  "<C-w><",              { desc = "Resize window narrower" })
map("n", "<leader><Right>", "<C-w>>",              { desc = "Resize window wider" })
map("n", "<leader><Up>",    "<C-w>+",              { desc = "Increase window height" })
map("n", "<leader><Down>",  "<C-w>-",              { desc = "Decrease window height" })

