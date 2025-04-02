return {
    "echasnovski/mini.map",
    version = false,
    dependencies = {
        "echasnovski/mini.diff",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require('mini.map').setup({
            window = {
                side = 'right',
                width = 10,
                winblend = 100,
                show_integration_count = false,
                focusable = true,
            },
            integrations = {
                require('mini.map').gen_integration.builtin_search(),
                require('mini.map').gen_integration.diagnostic({
                    error = 'DiagnosticError',
                    warn  = 'DiagnosticWarn',
                    info  = 'DiagnosticInfo',
                    hint  = 'DiagnosticHint',
                }),
                require('mini.map').gen_integration.diff(),     -- Adds diff highlighting (if mini.diff is enabled)
                require('mini.map').gen_integration.gitsigns(), -- Adds Git status highlighting (if gitsigns.nvim is installed)
            },
            symbols = {
                encode = require('mini.map').gen_encode_symbols.dot('4x2'),
                scroll_line = '█',
                scroll_view = '┃',
            },
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("mini.map").open()
            end,
        })

        -- Key bindings for manual control
        vim.api.nvim_set_keymap('n', '<leader>mo', ':lua require("mini.map").open()<CR>',
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>mc', ':lua require("mini.map").close()<CR>',
            { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<leader>mt', ':lua require("mini.map").toggle_focus(true)<CR>',
            { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<leader>mr', ':lua require("mini.map").refresh()<CR>',
            { noremap = true, silent = true })
    end,
}
