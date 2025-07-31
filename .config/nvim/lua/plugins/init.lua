return {
  {
    "mason-org/mason.nvim",
    enabled = false,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {
  --     latex = {
  --       enabled = true,
  --       render_modes = true,
  --       converter = "latex2text",
  --       highlight = "RenderMarkdownMath",
  --       position = "below",
  --       top_pad = 1,
  --       bottom_pad = 1,
  --     },
  --   },
  --   lazy = false,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "rust",
        "fish",
        "bash",
        "toml",
        "python",

        "markdown",
        "markdown_inline",
        "html",
        "latex",
        "typst",
        "yaml",
      },
    },
  },
}
