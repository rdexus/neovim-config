return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { desc = "Harpoon: " .. desc })
        end

        map("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Open Harpoon Window")
        map("<leader>a", function() harpoon:list():add() end, "Add Buffer To List")

        map("<C-h>", function() harpoon:list():select(1) end, "Go to buffer 1")
        map("<C-t>", function() harpoon:list():select(2) end, "Go to 2")
        map("<C-n>", function() harpoon:list():select(3) end, "Go to 3")
        map("<C-s>", function() harpoon:list():select(4) end, "Go to 4")

        map("<C-S-P>", function() harpoon:list():prev() end, "Go to previous buffer")
        map("<C-S-N>", function() harpoon:list():next() end, "Go to next buffer")
    end
}
