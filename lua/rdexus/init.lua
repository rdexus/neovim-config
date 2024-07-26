local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("rdexus.set")
require("rdexus.remap")
require("rdexus.autocmds")

require("lazy").setup("rdexus.plugins", {
    change_detection = {
        notify = false,
    },
})

