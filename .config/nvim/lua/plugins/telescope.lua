return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            local builtin = require("telescope.builtin")
            local telescope = require("telescope")

            telescope.setup({})

            pcall(telescope.load_extension, "fzf")

            vim.keymap.set("n", "<leader>?", builtin.oldfiles)
            vim.keymap.set("n", "<leader><space>", builtin.buffers)
            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end)

            vim.keymap.set("n", "<leader>sf", builtin.find_files)
            vim.keymap.set("n", "<leader>sh", builtin.help_tags)
            vim.keymap.set("n", "<leader>sw", builtin.grep_string)
            vim.keymap.set("n", "<leader>sg", builtin.live_grep)
            vim.keymap.set("n", "<leader>sh", function()
                builtin.find_files({ hidden = true, no_ignore = true })
            end)
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
}
