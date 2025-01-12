return {
	"glepnir/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			-- Customize lspsaga settings here (optional)
			finder = {
				keys = {
					edit = "<CR>", -- Open reference
					vsplit = "v", -- Open in vertical split
					split = "s", -- Open in horizontal split
					quit = "q", -- Close the finder
				},
			},
			outline = {
				auto_preview = false, -- Set to true if you want previews on hover
				keys = {
					jump = "<CR>", -- Jump to symbol
					quit = "q", -- Close the outline
				},
			},
			symbol_in_winbar = {
				enable = false,
			},
		})
	end,
}
