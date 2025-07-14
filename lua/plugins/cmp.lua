-- This is for autocompletion
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",    -- Buffer completions
    "hrsh7th/cmp-path",      -- Path completions
    "L3MON4D3/LuaSnip",      -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completions for LuaSnip
     "onsails/lspkind.nvim", 
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      experimental = {
        ghost_text = true,
      },
    })

    -- Optional: Update LSP capabilities for better integration with nvim-cmp.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- You can pass these capabilities to your lspconfig setups like:
    -- require('lspconfig').rust_analyzer.setup({ capabilities = capabilities })
    -- require('lspconfig').lua_ls.setup({ capabilities = capabilities, settings = { ... } })
  end,
}
