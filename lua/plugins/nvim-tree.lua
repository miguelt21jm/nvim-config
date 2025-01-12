return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            actions = {
                open_file = {
                    quit_on_open = true, -- Automatically close nvim-tree when opening a file
                },
            },
            vim.keymap.set('n', '<leader>e', function()
                require('nvim-tree.api').tree.toggle({ find_file = true })
            end, { desc = "Toggle NvimTree and reveal current file" }),

            vim.keymap.set('n', '<leader>F', function()
                require('nvim-tree.api').live_filter.start()
            end, { desc = "Start live filter in NvimTree" })

        }
    end,
}
