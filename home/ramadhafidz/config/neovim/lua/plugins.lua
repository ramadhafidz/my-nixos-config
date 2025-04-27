return {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Treesitter for Highlight syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = {
    "nvim-lua/plenary.nvim"
  } },

  -- File explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },
}
