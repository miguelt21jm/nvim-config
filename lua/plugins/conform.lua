-- This is for formatting. Note: in windows you need to add them to the path.

return {
    "stevearc/conform.nvim",
    config = function()

        require("conform").setup({
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
