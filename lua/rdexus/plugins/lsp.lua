return {
    -- autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
                performance = {
                    debounce = 0, -- default is 60ms
                    throttle = 0, -- default is 30ms
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart", "LspStop", "LspRestart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
        },
        config = function()
            require("fidget").setup()
            local nvim_lsp = require('lspconfig')
            local mason = require('mason')
            local mason_lspconfig = require('mason-lspconfig')

            local lspconfig_defaults = nvim_lsp.util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "bashls",
                    "gopls",
                    "lua_ls",
                    "basedpyright",
                    "yamlls",
                    "intelephense",
                    "html",
                    "ts_ls",
                    "jsonls",
                    "cssls", -- change the capabilities so it has completion
                },
                handlers = {
                    function(server_name)
                        nvim_lsp[server_name].setup({})
                    end,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local telescope = require("telescope.builtin")
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("<leader>gd", telescope.lsp_definitions, "Goto Definition")
                    map("<leader>gr", telescope.lsp_references, "Goto References")
                    map("<leader>gi", telescope.lsp_implementations, "Goto Implementation")
                    map("<leader>go", telescope.lsp_type_definitions, "Type Definition")
                    map("<leader>p", telescope.lsp_document_symbols, "Document Symbols")
                    map("<leader>vws", telescope.lsp_workspace_symbols, "Workspace Symbols")
                    map("<leader>vWs", telescope.lsp_dynamic_workspace_symbols, "Dynamic Workspace Symbols")

                    map("<leader>vrn", vim.lsp.buf.rename, "Rename Symbols")
                    map("<leader>vf", vim.lsp.buf.format, "Format file")
                    map("<leader>of", vim.diagnostic.open_float, "Open Diagnostic Float")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gd", vim.lsp.buf.declaration, "Goto Declaration")
                    map("<leader>vca", vim.lsp.buf.code_action, "Code Action")
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                        { buffer = event.buf, desc = "LSP: Signature Documentation" })
                end
            })
        end
    }
}
