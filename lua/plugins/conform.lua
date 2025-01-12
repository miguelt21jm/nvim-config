return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			default_format_opts = {

				lsp_format = "fallback",
			},
		})
		vim.keymap.set("n", "<Leader><Leader>", function()
			conform.format({ async = true })
		end, { desc = "Format buffer using Conform" })
	end,
}
