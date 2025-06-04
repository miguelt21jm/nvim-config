-- Auto pair brackets, quotes, etc. in Neovim using nvim-autopairs plugin
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- enable Tree-sitter awareness
        })
    end,
}
