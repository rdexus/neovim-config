-- Keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>of", function()
    -- THIS IS FOR BUILTIN LSP
    vim.diagnostic.open_float(nil, {
        scope = "cursor",
        focusable = false,
        close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
        },
    })
end,
{ noremap = true, silent = true }
)

vim.keymap.set('n', '<C-l>', '<C-W><C-L>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-W><C-K>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-W><C-J>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-W><C-H>', { noremap = true, silent = true })
