return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
        -- Define a function for setting up LSP keybindings
        local keybings_on_buffer = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- Keybindings for LSP functionality
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                    -- Hover documentation
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)              -- Go to definition
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)             -- Go to declaration
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)          -- Go to implementation
            vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)           -- Find references (with Lspsaga)
            vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code actions (with Lspsaga)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)          -- Rename symbol
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)            -- Go to previous diagnostic
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)            -- Go to next diagnostic
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts) -- Format code
        end

        -- Configure rustaceanvim with LSP settings
        require("rustaceanvim").setup({
            server = {

                on_attach = keybings_on_buffer, -- Attach keybindings when LSP starts
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "clippy"
                        },
                    },
                },
            },
        })
    end,

}

