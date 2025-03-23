return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Hoffs/omnisharp-extended-lsp.nvim"
    },
    config = function()
        local lspconfig = require("lspconfig")

        local on_attach = function(_, bufnr)
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
                vim.lsp.buf.format { async = true }
            end, opts)
        end

        -- local omni_on_attach = function(_, bufnr)
            --     local opts = { noremap = true, silent = true, buffer = bufnr }
            --     local keymap = vim.keymap.set
            --     local omni_ext = require("omnisharp_extended")
            --
            --     vim.keymap.set("n", "gd", require("omnisharp_extended").telescope_lsp_definition, { noremap = true })
            --     keymap("n", "gD", vim.lsp.buf.declaration, opts)
            --     keymap("n", "gi", function() omni_ext.lsp_implementation() end, opts)
            --     keymap("n", "gr", function() omni_ext.lsp_references() end, opts)
            --     keymap("n", "K", vim.lsp.buf.hover, opts)
            --     keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
            --     keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            --
            --     keymap("n", "<leader>f", function()
                --         vim.lsp.buf.format { async = true }
                --     end, opts)
                -- end

                lspconfig.rust_analyzer.setup({
                    on_attach = on_attach,
                })

                lspconfig.lua_ls.setup({
                    on_attach = on_attach,
                })

                lspconfig.omnisharp.setup({
                    handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler },
                    on_attach = on_attach,
                    cmd = {
                        "C:\\Users\\MiguelJoseTamaraJaim\\AppData\\Local\\nvim-data\\mason\\bin\\omnisharp.cmd",
                        "--languageserver",
                        "--hostPID", tostring(vim.fn.getpid())
                    },
                    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
                })
            end,
        }
