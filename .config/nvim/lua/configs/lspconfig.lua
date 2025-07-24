require("nvchad.configs.lspconfig").defaults()

local servers = {
  "bashls",

  "clangd",

  "tombi",
  "ruff",
  "pyright",

  "html",
  "cssls",
  "marksman",
}

vim.lsp.enable(servers)
