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

        lspconfig.powershell_es.setup({
            on_attach = on_attach,
            filetypes = { "ps1", "psm1", "psd1" },
            bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
            init_options = {
                enableProfileLoading = false,
            },
        })

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

        local bin_path = vim.fn.stdpath("data") .. "\\mason\\bin\\"

        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            cmd = { bin_path .. "lua-language-server.cmd" },
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
                bin_path .. "omnisharp-extended-lsp.cmd",
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
