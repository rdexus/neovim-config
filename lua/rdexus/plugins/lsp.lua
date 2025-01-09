return {
    -- autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
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

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    {
                        { name = 'path' }
                    },
                    {
                        {
                            name = 'cmdline',
                            option = {
                                ignore_cmds = { 'Man', '!' }
                            }
                        }
                    }
                )
            })
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "j-hui/fidget.nvim",
        },
        config = function()
            local nvim_lsp = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            local lspconfig_defaults = nvim_lsp.util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lspconfig_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            require("fidget").setup()
            mason.setup()
            mason_lspconfig.setup({
                automatic_installation = true,
                ensure_installed = {
                    "intelephense",
                    "html",
                    "ts_ls",
                    "cssls",
                    "jsonls",
                    "lua_ls",
                    "bashls",
                    "gopls",
                    "basedpyright",
                    "yamlls",
                    -- linters
                    -- "eslint_d",
                    -- "phpstan",
                    -- "htmlhint",
                    -- formatters
                    -- "php-cs-fixer",
                    -- "prettier",
                },
                handlers = {
                    function(server_name)
                        nvim_lsp[server_name].setup({})
                    end,

                    ["cssls"] = function()
                        local capabilities = lspconfig_defaults.capabilities
                        capabilities.textDocument.completion.completionItem.snippetSupport = true

                        nvim_lsp.cssls.setup({
                            capabilities = capabilities
                        })
                    end
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local telescope = require("telescope.builtin")
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", telescope.lsp_definitions, "Goto Definition")
                    map("gi", telescope.lsp_implementations, "Goto Implementation")
                    map("<leader>vrr", telescope.lsp_references, "Goto References")
                    map("<leader>vtd", telescope.lsp_type_definitions, "Type Definition")
                    map("<leader>vds", telescope.lsp_document_symbols, "Document Symbols")
                    map("<leader>vws", telescope.lsp_workspace_symbols, "Workspace Symbols")
                    map("<leader>vWs", telescope.lsp_dynamic_workspace_symbols, "Dynamic Workspace Symbols")

                    map("<leader>vrn", vim.lsp.buf.rename, "Rename Symbols")
                    map("<leader>vf", vim.lsp.buf.format, "Format file")
                    map("<leader>of", vim.diagnostic.open_float, "Open Diagnostic Float")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>gd", vim.lsp.buf.declaration, "Goto Declaration")
                    map("<leader>vca", vim.lsp.buf.code_action, "Code Action")
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
                        { buffer = event.buf, desc = "LSP: Signature Documentation" })
                end
            })
        end
    }
}
