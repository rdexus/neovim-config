return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = require("telescope.themes").get_dropdown({
                prompt_prefix = "🔍 ",
                sorting_strategy = "ascending",
                layout_config = {
                    width = 0.8,
                    prompt_position = "top",
                },
            }),
        })
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files",     mode = "n" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope live grep",      mode = "n" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope buffers",        mode = "n" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>",   desc = "Telescope find old files", mode = "n" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Vim help tags",            mode = "n" },
    }
}
