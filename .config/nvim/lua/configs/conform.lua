local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "shfmt" },

    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },

    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
