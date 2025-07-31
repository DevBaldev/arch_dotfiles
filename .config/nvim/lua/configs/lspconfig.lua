require("nvchad.configs.lspconfig").defaults()

local servers = {
  "bashls",

  "ruff",
  "pylsp",

  "marksman",

  "tombi",
  "rust_analyzer",
}

vim.lsp.enable(servers)
