local M = {}

function M.setup()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Basic
  map("n", "<leader>q", ":q<CR>", opts) -- Quit file
  map("n", "<leader>w", ":w<CR>", opts) -- Save file
  map("n", "<leader>wa", ":wa<CR>", opts) -- Save all files
  map("n", "<leader>x", ":x<CR>", opts) -- Save and quit

  -- Telescope
  map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

  -- Bufferline Tab
  map('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
  map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  map('n', '<Leader>x', ':bdelete<CR>', { noremap = true, silent = true }) -- Tutup tab

  -- Laravel Specific Keymaps
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
      vim.keymap.set("n", "<leader>la", ":Artisan ", { desc = "Run Artisan Command" })
      vim.keymap.set("n", "<leader>lr", ":Telescope laravel routes<CR>", { desc = "Search Routes" })
      vim.keymap.set("n", "<leader>lm", ":Telescope laravel models<CR>", { desc = "Search Models" })
    end
  })

  -- Blade file support
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.blade.php",
    callback = function()
      vim.bo.filetype = "blade"
    end
  })
end

return M
