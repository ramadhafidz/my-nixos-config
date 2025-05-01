local M = {}

function M.setup()
  local opt = vim.opt

  -- UI Config
  opt.number = true
  opt.relativenumber = true
  opt.cursorline = true
  opt.showmode = false

  -- Tab
  opt.tabstop = 2
  opt.softtabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = true
  opt.smartindent = true

  opt.wrap = false
  opt.termguicolors = true

  -- Searching
  opt.incsearch = true
  opt.smartcase = true
  opt.ignorecase = true

  -- Inputs (Keyboard/Mouse)
  opt.mouse = "a"
  opt.clipboard = "unnamedplus"
end

return M
