return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",      -- Buffer completions
		"hrsh7th/cmp-path",        -- File path completions
		"hrsh7th/cmp-nvim-lsp",    -- LSP completions
		"hrsh7th/cmp-cmdline",     -- Command line completions
		"hrsh7th/cmp-git",         -- Git completions
		"L3MON4D3/LuaSnip",        -- Snippet engine
		"saadparwaiz1/cmp_luasnip",-- Snippet completions
		"windwp/nvim-autopairs",   -- Auto-close brackets, pairs, etc.
	},
	event = "VeryLazy",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		--
		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Configure nvim-cmp
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
				["<C-e>"] = cmp.mapping.abort(),        -- Close completion menu
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },  -- LSP completions
				{ name = "luasnip" },   -- Snippets
				{ name = "buffer" },    -- Buffer completions
				{ name = "path" },      -- Path completions
			}),
		})

		-- Configure command line completion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "cmdline" },
			},
		})

		-- Configure git completions (requires git plugin)
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
				{ name = "buffer" },
			}),
		})

		-- Configure autopairs integration
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
