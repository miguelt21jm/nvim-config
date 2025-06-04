-- This is for formatting. Note: in windows you need to add them to the path.

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				csharpier = {
					meta = {
						url = "https://github.com/belav/csharpier",
						description = "The opinionated C# code formatter.",
					},
					command = "dotnet",
					args = {
						"csharpier",
						"--config-path",
						vim.fn.expand("$HOME/.config/csharpier/.csharpierrc"),
						"--write-stdout",
					},
					stdin = true, -- because --write-stdout makes CSharpier read from stdin
				},
			},
			formatters_by_ft = {
				sql = { "sqlfluff", "fix", "--dialect", "ansi" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				cs = { "csharpier" },
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ async = true })
		end, { desc = "Format current buffer" })
	end,
}
