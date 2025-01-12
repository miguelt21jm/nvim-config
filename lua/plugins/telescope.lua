-- lua/plugins/telescope/init.lua

-- Telescope defaults
local defaults = {
    vimgrep_arguments = {
        "rg", -- Ripgrep
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
    },
    prompt_prefix = "🔍 ", -- Custom prompt symbol
    selection_caret = " ", -- Custom selection symbol
    path_display = { "truncate" }, -- Shorten long file paths
}

-- Telescope pickers
local pickers = {
  find_files = {
    theme = "dropdown",
    find_command = { -- Custom Ripgrep command for `find_files`
      "rg",
      "--files", -- List files only
      "--hidden", -- Include hidden files
      "--glob", "!target/**", -- Exclude the `target` directory
      "--glob", "!.git/**", -- Exclude the `.git` directory
      "--glob", "!Cargo.toml", -- Exclude Cargo.toml
      "--glob", "!Cargo.lock", -- Exclude Cargo.lock
    },
  },
}

-- Telescope key mappings
local keymaps = {
    { key = "<leader>ff", cmd = "find_files", desc = "Find files" },
    { key = "<leader>fg", cmd = "live_grep",  desc = "Live grep" },
    { key = "<leader>fb", cmd = "buffers",    desc = "List buffers" },
    { key = "<leader>fh", cmd = "help_tags",  desc = "Help tags" },
    { key = "<leader>fs", cmd = "lsp_document_symbols",  desc = "Document symbols" },
}

-- Return plugin configuration
return {
    "nvim-telescope/telescope.nvim",          -- Telescope plugin
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")

        -- Setup Telescope with modular configurations
        telescope.setup({
            defaults = defaults,
            pickers = pickers,
            extensions = {},
        })

        -- Apply keymaps
        local builtin = require("telescope.builtin")
        for _, map in ipairs(keymaps) do
            if type(map.cmd) == "string" then
                vim.keymap.set("n", map.key, builtin[map.cmd], { desc = map.desc })
            elseif type(map.cmd) == "function" then
                vim.keymap.set("n", map.key, map.cmd, { desc = map.desc })
            end
        end
    end,
}
