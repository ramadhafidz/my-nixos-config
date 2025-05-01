require("nvim-tree").setup({
  tab = {
    sync = {
      open = true,
      close = true,
    }
  }
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
