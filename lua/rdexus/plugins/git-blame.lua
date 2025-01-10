return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = false,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%r",
        virtual_text_column = 1,
    },
    keys = {
        { "<leader>gb", "<cmd>GitBlameToggle<CR>", desc = "Toggle git blame", mode = "n" },
    },
}

