return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('solarized').setup({
        styles = {
        comments = {},
        functions = {},
        variables = {},
        numbers = {},
        constants = {},
        parameters = {},
        keywords = {},
        types = {},
      },
    })

    vim.o.background = 'dark' -- or 'light'
    vim.cmd.colorscheme 'solarized'
  end,
}
