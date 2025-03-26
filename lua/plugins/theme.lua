return {
	"rebelot/kanagawa.nvim",
	priority = 9999,
	config = function()
		require("kanagawa").setup({
			-- Optional tweaks:
			compile = false,
			commentStyle = { italic = true },
			keywordStyle = { italic = false },
			functionStyle = { bold = true },
			typeStyle = { bold = true },
			transparent = false,
		})

		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
