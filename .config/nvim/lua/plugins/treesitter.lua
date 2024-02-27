return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                ignore_install = {},
                auto_install = true,
                modules = {},
                ensure_installed = {
                    "c",
                    "javascript",
                    "jsdoc",
                    "json",
                    "html",
                    "css",
                    "scss",
                    "yaml",
                    "lua",
                    "rust",
                    "zig",
                    "typescript",
                    "tsx",
                    "dockerfile",
                    "ocaml",
                    "haskell",
                    "go",
                    "python",
                },

                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                    disable = { "python" },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]C"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                    },
                },
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-context", opts = {} },
}
