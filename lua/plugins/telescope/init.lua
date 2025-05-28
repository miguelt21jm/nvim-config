return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- More of a pipeline, order of setup matters.
    config = function()
        require("plugins.telescope.config").setup()
        require("plugins.telescope.omnisharp").setup()
    end,
}
