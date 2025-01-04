return {
  'stephpy/vim-php-cs-fixer',
  config = function()
    vim.g.php_cs_fixer_path = './vendor/bin/php-cs-fixer'
    vim.g.php_cs_fixer_config_file = '.php-cs-fixer.php'

    vim.api.nvim_create_augroup('PhpCsFixOnSave', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = 'PhpCsFixOnSave',
      pattern = { '*.php' },
      command = 'silent! call PhpCsFixerFixFile()',
    })
  end
}
