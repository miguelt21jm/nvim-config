-------------------------------------------------------------------------- Function to set up VSCode-specific key mappings
local function setup_vscode_mappings()
	vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })

	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "<leader>ff", function()
		vim.fn.VSCodeNotify("workbench.action.quickOpen")
	end, opts)

	vim.keymap.set("n", "<leader>e", function()
		vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
	end, opts)

	vim.keymap.set("n", "<leader>fs", function()
		vim.fn.VSCodeNotify("workbench.action.quickOpen", "@:")
	end, opts)

	vim.keymap.set("n", "<leader>fS", function()
		vim.fn.VSCodeNotify("workbench.action.quickOpen", "#")
	end, opts)

	vim.keymap.set("n", "<leader>fw", function()
		vim.fn.VSCodeNotify("workbench.action.quickOpen", "%")
	end, opts)

	vim.keymap.set("n", "<leader>cf", function()
		vim.fn.VSCodeNotify("editor.action.formatDocument")
	end, opts)

	vim.keymap.set("n", "<leader>ca", function()
		vim.fn.VSCodeNotify("editor.action.codeAction")
	end, opts)

	vim.keymap.set("n", "<leader>rn", function()
		eim.fn.VSCodeNotify("editor.action.rename")
	end, opts)

	vim.keymap.set("n", "gi", function()
		vim.fn.VSCodeNotify("editor.action.goToImplementation")
	end, opts)

	vim.keymap.set("n", "gr", function()
		vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
	end, opts)
end

---------------------------------------------------------------------------------------INIT
require("keymaps")
if vim.g.vscode then
	local opts = { desc = "Move by display line", silent = true, remap = true }
	vim.keymap.set({ "n", "v" }, "j", "gj", opts)
	vim.keymap.set({ "n", "v" }, "k", "gk", opts)
	vim.keymap.set({ "n", "v" }, "$", "g$", opts)
	vim.keymap.set({ "n", "v" }, "0", "g0", opts)
	setup_vscode_mappings()
else
	require("editor")
	require("lazy-setup")
end
