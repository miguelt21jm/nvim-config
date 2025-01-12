-- lua/plugins/treesitter/init.lua

-- Parsers to install
local parsers = {
  "lua",
  "python",
  "javascript",
  "html",
  "css",
  "bash",
  "c_sharp",
  "go",
  "rust",
}

-- Highlighting configuration
local highlight = {
  enable = true, -- Enable syntax highlighting
  additional_vim_regex_highlighting = false, -- Disable Vim's regex highlighting
}

-- Incremental selection configuration
local incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "gnn",   -- Start selection
    node_incremental = "grn", -- Increment to the next node
    scope_incremental = "grc",-- Increment to the scope
    node_decremental = "grm", -- Decrement to the previous node
  },
}

-- Text objects configuration
local textobjects = {
  select = {
    enable = true,
    lookahead = true, -- Automatically jump forward to the text object
    keymaps = {
      ["af"] = "@function.outer", -- Around function
      ["if"] = "@function.inner", -- Inside function
      ["ac"] = "@class.outer",    -- Around class
      ["ic"] = "@class.inner",    -- Inside class
    },
  },
}

-- Main plugin configuration (returned)
return {
  "nvim-treesitter/nvim-treesitter", -- Main Tree-sitter plugin
  build = ":TSUpdate",               -- Automatically run `:TSUpdate` after installing
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = parsers,               -- Use external parsers variable
      highlight = highlight,                    -- Use external highlight variable
      incremental_selection = incremental_selection, -- External incremental selection
      textobjects = textobjects,                -- External text objects
    })
  end,
}
