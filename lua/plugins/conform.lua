-- This is for formatting. Note: in windows you need to add them to the path.

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" }, -- Rust: rustfmt
				cs = { "csharpier" }, -- C#: dotnet-format
				["*"] = { "./prettierd" }, -- General fallback for all other filetypes
			},
			format_on_save = {
				lsp_fallback = true, -- Uses LSP formatting if no formatter is set
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ async = true })
		end, { desc = "Format current buffer" })
	end,
}
