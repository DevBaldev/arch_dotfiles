require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "bashls", "pyright", "html", "cssls", "marksman" }
vim.lsp.enable(servers)
