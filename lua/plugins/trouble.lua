return {
	"folke/trouble.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("trouble").setup({})

		-- local open_with_trouble = require("trouble.sources.telescope").open
		-- local telescope = require("telescope")
		-- telescope.setup({
		-- 	defaults = {
		-- 		mappings = {
		-- 			i = { ["<c-t>"] = open_with_trouble },
		-- 			n = { ["<c-t>"] = open_with_trouble },
		-- 		},
		-- 	},
		-- })
		-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", opts)
	end,
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.severity=1 focus=true<cr>",
			desc = "Diagnostics (Errors Only)",
		},
	},
}
