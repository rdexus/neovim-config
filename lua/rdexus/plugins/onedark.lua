return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = 'warmer',

            -- Options are italic, bold, underline, none
            code_style = {
                comments = 'italic',
                keywords = 'italic',
                functions = 'italic',
                strings = 'none',
                variables = 'none'
            },
        })

        -- require("onedark").load()
    end,
}
