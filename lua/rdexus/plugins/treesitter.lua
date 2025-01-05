return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        ensure_installed = {
            "bash",
            "go",
            "lua",
            "python",
            "regex",
            "vim",
            "yaml",
            "php",
            "javascript",
            "typescript",
            "json",
            "html",
            "css",
            "markdown",
            "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
