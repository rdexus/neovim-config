return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({})

        vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>");
        vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>");
        vim.keymap.set("n", "<leader>btp", ":BufferLineTogglePin<CR>");
        vim.keymap.set("n", "<leader>bmn", ":BufferLineMoveNext<CR>");
        vim.keymap.set("n", "<leader>bmp", ":BufferLineMovePrev<CR>");
    end,
}
