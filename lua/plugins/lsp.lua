-- Define a function for setting up LSP keybindings
local keybings_on_buffer = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keybindings for LSP functionality
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Hover documentation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
    vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts) -- Find references (with Lspsaga)
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code actions (with Lspsaga)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Go to next diagnostic
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts) -- Format code
end

-- LSP settings for lua_ls
local lua_ls_settings = {
    on_attach = keybings_on_buffer,
    settings = {
        Lua = {
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
}

local ts_settings = {
    on_attach = keybings_on_buffer,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
            },
        },
    },
}

-- LSP settings for pyright
local pyright_settings = {
    on_attach = keybings_on_buffer,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
}


-- -- LSP settings for rust_analyzer
-- local rust_analyzer_settings = {
--     on_attach = keybings_on_buffer,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "by_self",
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true,
--             },
--             procMacro = {
--                 enable = true,
--             },
--         },
--     },
-- }


-- Return the plugin configuration for Lazy.nvim
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("lspconfig").lua_ls.setup(lua_ls_settings)
        require("lspconfig").tsserver.setup(ts_settings)
        require("lspconfig").pyright.setup(pyright_settings)
        -- require("lspconfig").rust_analyzer.setup(rust_analyzer_settings)
    end,
}
