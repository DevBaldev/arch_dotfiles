local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    toml = { "tombi" },
    rust = { "rustfmt" },

    bash = { "shfmt" },
    python = { "ruff format" },

    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
