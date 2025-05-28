local actions = require("telescope.actions")
local telescope = require("telescope")
local MAX_LEN = 40

local defaults = {
    sorting_strategy  = "ascending",
    vimgrep_arguments = {
        "rg", "--color=never", "--no-heading",
        "--with-filename", "--line-number",
        "--column", "--smart-case",
    },
    prompt_prefix     = "🔍 ",
    selection_caret   = " ",
    path_display      = {},
    mappings          = {
        i = {
            ["<C-Tab>"] = function(bufnr)
                actions.move_selection_next(bufnr); return true
            end,
            ["<C-S-Tab>"] = function(bufnr)
                actions.move_selection_previous(bufnr); return true
            end,
        },
    },
}

local pickers = {
    find_files = {
        theme = "dropdown",
        find_command = {
            "rg", "--files", "--hidden",
            "--glob", "!target/**",
            "--glob", "!.git/**",
            "--glob", "!Cargo.toml",
            "--glob", "!Cargo.lock",
        },
        path_display = function(_, full)
            if #full > MAX_LEN then
                return vim.fn.fnamemodify(full, ":t")
            end
            return full
        end,
    },
}

local keymaps = {
    { "<leader>ff", "find_files",                "Find files" },
    { "<leader>fw", "live_grep",                 "Live grep" },
    { "<leader>fb", "buffers",                   "List buffers" },
    { "<C-Tab>",    "buffers",                   "List buffers" },
    { "<C-S-Tab>",  "buffers",                   "List buffers" },
    { "<leader>fg", "current_buffer_fuzzy_find", "Fuzzy find buffer" },
    { "<leader>fh", "help_tags",                 "Help tags" },
    { "gr",         "lsp_references",            "References" },
    { "gi",         "lsp_implementations",       "Implementations" },
    { "gd",         "lsp_definitions",           "Definitions" },
}

local M = {}

function M.setup()
    telescope.setup {
        defaults   = defaults,
        pickers    = pickers,
        extensions = {},
    }
    local builtin = require("telescope.builtin")
    for _, m in ipairs(keymaps) do
        local lhs, cmd, desc = unpack(m)
        vim.keymap.set("n", lhs, builtin[cmd], { desc = desc })
    end

    -- Special keymap
    -- define, per‑filetype, the LSP SymbolKinds you want to see
    local ft_symbols = {
        rust   = { "Module", "Struct", "Enum", "Interface", "Function", "Method" },
        cs     = { "Class", "Enum", "Interface", "Struct", "Method", "Function" },
        lua    = { "Module", "Function" },
        python = { "Module", "Class", "Function" },
    }

    vim.api.nvim_create_autocmd("FileType", {
        pattern = vim.tbl_keys(ft_symbols),
        callback = function(ctx)
            local bufnr   = ctx.buf
            local ft      = ctx.match -- the filetype
            local symbols = ft_symbols[ft]

            vim.keymap.set("n", "<leader>fs", function()
                builtin.lsp_document_symbols {
                    symbols = symbols,
                }
            end, {
                buffer = bufnr,
                desc   = ft .. " symbols: " .. table.concat(symbols, ", "),
            })
        end,
    })

    vim.lsp.handlers["textDocument/references"] = function(err, result, ctx, config)
        telescope.builtin.lsp_references({ bufnr = ctx.bufnr })
    end
end

return M
