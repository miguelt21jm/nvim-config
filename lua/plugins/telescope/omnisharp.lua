local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cs",
        callback = function(ctx)
            local opts = { buffer = ctx.buf, desc = "OmniSharp LSP" }
            vim.keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>", opts)
            vim.keymap.set("n", "<leader>D", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>", opts)
        end,
    })
end

return M
