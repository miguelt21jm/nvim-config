return {
  "ghillb/cybu.nvim",
  branch = "main",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("cybu").setup({
      position = {
        relative_to = "editor", -- center in full editor
        anchor = "center",      -- center of the screen
        max_win_height = 5,
        max_win_width = 0.5,
      },
      style = {
        path = "relative",
        border = "rounded",
        separator = " │ ",
        prefix = "  ",
        padding = 1,
        hide_buffer_id = true,
      },
      behavior = {
        mode = {
          default = {
            switch = "immediate",
            view = "paging",
          },
        },
      },
    })

    vim.keymap.set("n", "<c-Tab>", "<Plug>(CybuNext)", { silent = true })
    vim.keymap.set("n", "<c-s-Tab>", "<Plug>(CybuPrev)", { silent = true })
  end,
}
