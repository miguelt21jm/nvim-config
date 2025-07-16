return {
	"folke/trouble.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("trouble").setup({})
	end,
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.severity=1 focus=true<cr>",
			desc = "Diagnostics (Errors Only)",
		},
	},
}
