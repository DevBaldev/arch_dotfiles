local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  tabufline = {
    lazyload = true,
  },
  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "round", -- default/round/block/arrow
  },
}

return M
