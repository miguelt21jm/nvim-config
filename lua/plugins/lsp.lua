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

			keymap("n", "gd", vim.lsp.buf.definition, opts)
			keymap("n", "gD", vim.lsp.buf.declaration, opts)
			keymap("n", "gi", vim.lsp.buf.implementation, opts)
			keymap("n", "gr", vim.lsp.buf.references, opts)
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					inlayHints = {
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
						lifetimeElisionHints = {
							enable = "never",
							useParameterNames = false,
						},
						maxLength = 25,
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

		lspconfig.omnisharp.setup({
			handlers = { ["textDocument/definition"] = require("omnisharp_extended").handler },
			on_attach = on_attach,
			cmd = {
				"C:\\Users\\MiguelJoseTamaraJaim\\AppData\\Local\\nvim-data\\mason\\bin\\omnisharp.cmd",
				"--languageserver",
				"--hostPID",
				tostring(vim.fn.getpid()),
			},
			root_dir = lspconfig.util.root_pattern("*.sln", ".git"),
			settings = {
				RoslynExtensionsOptions = {
					InlayHintsOptions = {
						EnableForParameters = true,
						ForLiteralParameters = true,
						ForIndexerParameters = true,
						ForObjectCreationParameters = true,
						ForOtherParameters = true,
						SuppressForParametersThatDifferOnlyBySuffix = false,
						SuppressForParametersThatMatchMethodIntent = false,
						SuppressForParametersThatMatchArgumentName = false,
						EnableForTypes = true,
						ForImplicitVariableTypes = true,
						ForLambdaParameterTypes = true,
						ForImplicitObjectCreatio = true,
					},
				},
			},
		})
	end,
}
