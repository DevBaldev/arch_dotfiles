---@type ChadrcConfig
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
    lazyload = false,
  },
  statusline = {
    enabled = true,
    theme = "vscode", -- default/vscode/vscode_colored/minimal
    separator_style = "default", -- default/round/block/arrow
  },
}

return M
