require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "bashls", "tombi", "pyright", "html", "cssls", "marksman" }
vim.lsp.enable(servers)
