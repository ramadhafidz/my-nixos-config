return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        }
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },

  -- Treesitter for Highlight syntax
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript" },
        highlight = { enable = true }
      })
    end
  },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Statusline
  { 
    "nvim-lualine/lualine.nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
      'catppuccin/nvim'
    },
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
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" }
      })
    end
  },

  { 'github/copilot.vim' },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup({
        auto_save = true,
        auto_restore = true,
      })
      vim.keymap.set('n', '<leader>ls', require('auto-session.session-lens').search_session, { noremap = true })
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  },
}
