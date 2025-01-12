-- lua/lazy-setup.lua

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.treesitter" },
    { import = "plugins.telescope" },
    { import = "plugins.theme" },
    { import = "plugins.cmp" },
    { import = "plugins.mason" },
    { import = "plugins.lsp" },
    { import = "plugins.lspsaga" },
    { import = "plugins.nvim-tree" },
    { import = "plugins.noice" },
    { import = "plugins.copilot" },
    { import = "plugins.conform" },
})
