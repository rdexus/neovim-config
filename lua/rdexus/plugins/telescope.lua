return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        height = 0.9,           -- Adjust height (fraction of screen height)
                        preview_height = 0.4,   -- Height of the preview window
                    },
                    preview_cutoff = 40,      -- Don't show preview for narrow windows
                },
                -- Other default settings
                prompt_prefix = '🔍 ',
                selection_caret = '❯ ',
            },
        })
    end,
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files', mode = 'n' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep', mode = 'n' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers', mode = 'n' },
        { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Telescope find old files', mode = 'n' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Vim help tags', mode = 'n' },
    }
}
