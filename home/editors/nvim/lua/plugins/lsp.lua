return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = false,
            })

            local on_attach = function(bufnr)
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = "rounded",
                            source = "always",
                            prefix = " ",
                            scope = "line",
                        }
                        vim.diagnostic.open_float(opts)
                    end,
                })
            end

            -- Setup language servers.
            local status_ok, lspconfig = pcall(require, "lspconfig")
            if not status_ok then
                return
            end
            local servers = { "nixd", "rust_analyzer", "clangd" }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
            lspconfig.pyright.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "off",
                        },
                    },
                },
            })
            lspconfig.lua_ls.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            lspconfig.html.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                cmd = { "vscode-html-language-server", "--stdio" },
            })

            lspconfig.cssls.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                cmd = { "vscode-css-language-server", "--stdio" },
            })

            lspconfig.tsserver.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                cmd = { "typescript-language-server", "--stdio" },
            })

            lspconfig.bashls.setup({
                on_attach = on_attach(),
                capabilities = capabilities,
                cmd = { "bash-language-server", "start" },
            })

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            --[[ vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>fm', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            }) ]]
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "rust", "nix", "c++" },
                callback = function(args)
                    vim.api.nvim_create_autocmd("DiagnosticChanged", {
                        buffer = args.buf,
                        callback = function()
                            vim.diagnostic.hide()
                        end,
                    })
                    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
                        buffer = args.buf,
                        callback = function()
                            vim.diagnostic.show()
                        end,
                    })
                end,
            })
        end,
    },
}
