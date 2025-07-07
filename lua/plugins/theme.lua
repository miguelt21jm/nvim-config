return {
	"ficcdaf/ashen.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("ashen").setup({})
		vim.cmd("colorscheme ashen")
	end,
}
