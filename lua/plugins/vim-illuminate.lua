return {
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 100,
            filetypes_denylist = {
                "NvimTree",
                "TelescopePrompt",
                "alpha",
            },
        })
    end,
}
