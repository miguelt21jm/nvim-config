return {
	"RRethy/vim-illuminate",
	confign = function()
		local asdfas = asdfasdsdfsndfjkf
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 100,
			filetypes_denylist = {
				"NvimTree",
				"TelescopePrompt",
				"alpha",
			},
		})
	end,
}
