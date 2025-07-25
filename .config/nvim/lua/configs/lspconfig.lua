require("nvchad.configs.lspconfig").defaults()

local servers = {
  "tombi",
  "ruff",
  "pylsp",
}

vim.lsp.enable(servers)
