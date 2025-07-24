local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    bash = { "shfmt" },

    c = { "clang-format" },
    cpp = { "clang-format" },

    toml = { "tombi" },
    python = { "ruff format" },

    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
