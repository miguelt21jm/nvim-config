return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline_popup", -- Use a popup for the command-line
				format = {
					cmdline = {
						pattern = "^:", -- Match the `:` command-line
						icon = ":", -- Optional icon
						lang = "vim", -- Language for highlighting
					},
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = "50%", -- Center the popup vertically
						col = "50%", -- Center the popup horizontally
					},
					size = {
						width = 60, -- Width of the popup
						height = "auto", -- Adjust height automatically
					},
				},
			},
			notify = {
				enabled = false, -- Completely disable notifications
			},
			messages = {
				enabled = false, -- Disable messages if you don't want them
			},
			-- Add any other Noice settings here
		})
	end,
}
