return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true,
                },
                highlight_current_scope = { enable = false },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "<leader>rr",
                    },
                }
            },
            ensure_installed = {
                "bash",
                "go",
                "lua",
                "python",
                "regex",
                "vim",
                "yaml",
                "php",
                "jsdoc",
                "javascript",
                "typescript",
                "json",
                "html",
                "css",
                "scss",
                "markdown",
                "markdown_inline",
            },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        })
    end
}
