-- Indentation
vim.opt.tabstop = 4 -- How wide a <Tab> character is
vim.opt.shiftwidth = 4 -- How much to indent with >>
vim.opt.softtabstop = 4 -- How many spaces <Tab>/<BS> uses in insert
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Basic smart indenting
vim.opt.autoindent = true -- Copy indent from current line

-- Soft-wrapping
vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.showbreak = "↪ " -- prepend arrow on continuations
vim.opt.breakindent = true -- keep wrapped lines indented
vim.opt.breakindentopt = "shift:2,min:20" -- further tweak indent behavior

-- Make j/k navigate screen-lines when wrapped
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- Disable command shown when it's not command mode
vim.opt.cmdheight = 0
vim.opt.showmode = false -- optional: disable "-- INSERT --", etc.
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.opt.cmdheight = 0
	end,
})

-- Show line numbers
vim.opt.number = true -- show absolute line number on the current line
vim.opt.relativenumber = true -- show relative numbers on other lines

-- Wrapped lines motion
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
