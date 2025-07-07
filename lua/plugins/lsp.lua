return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end


		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					inlayHints = {
						assist = {
							importEnforceGranularity = true,
							importPrefix = "crate",
						},
						bindingModeHints = {
							enable = false,
						},
						chainingHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
							minLines = 25,
						},
						closureReturnTypeHints = {
							enable = "never",
						},
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
							experimental = {
								enable = true,
							},
						},
						lifetimeElisionHints = {
							enable = "never",
							useParameterNames = false,
						},
						maxLength = 5,
						parameterHints = {
							enable = true,
						},
						reborrowHints = {
							enable = "never",
						},
						renderColons = true,
						typeHints = {
							enable = true,
							hideClosureInitialization = false,
							hideNamedConstructor = false,
						},
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					hint = {
						enable = true,
					},
				},
			},
		})
	end,
}
