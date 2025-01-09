-- options
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.textwidth = 0
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.showtabline = 0
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.numberwidth = 2
vim.opt.title = true
vim.opt.confirm = true
vim.opt.showmode = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.preserveindent = true
vim.opt.swapfile = false

-- set clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- netrw
vim.g.netrw_browse_split = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.g.netrw_keepdir = 1

-- open float diagnostic window
vim.diagnostic.config({
  signs = false,
  virtual_text = false,
  severity_sort = true,
  update_in_insert = true,
})
