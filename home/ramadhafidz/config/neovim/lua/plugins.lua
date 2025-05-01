return {
  -- Theme
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('plugins.catppuccin')
    end
  },

  -- Treesitter for Highlight syntax
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('plugins.treesitter')
    end
  },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippets
  { "L3MON4D3/LuaSnip",
    config = function()
      require('plugins.luasnip')
    end
  },
  { "saadparwaiz1/cmp_luasnip" },

  -- Fuzzy finder
  { 
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },

  -- File explorer
  { 
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('plugins.nvim-tree')
    end
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Statusline
  { 
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.lualine")
    end
  },

  {
    "swaits/universal-clipboard.nvim",
    opts = {
      verbose = true,
    },
  },

  {
    "vyfor/cord.nvim",
    build = ':Cord update',
  },

  { "rcarriga/nvim-notify" },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },

  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.bufferline') 
    end
  },

  { 'github/copilot.vim' },

  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require('plugins.auto-session')
    end,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },

  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
      require('plugins.which-key')
    end,
  }
}
