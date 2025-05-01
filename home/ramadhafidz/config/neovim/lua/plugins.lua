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
          indent_blankline = true,
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
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
      local catppuccin_colors = require("catppuccin.palettes").get_palette("mocha")

      require("lualine").setup({
        tab = {
          sync = {
            open = true,
            close = true,
          }
        },

        actions = {
          open_file = {
            quit_on_open = false,
          },  
        },

        options = {
          theme = {
            normal = {
              a = { fg = catppuccin_colors.crust, bg = catppuccin_colors.mauve, gui = "bold" },
              b = { fg = catppuccin_colors.text, bg = catppuccin_colors.surface0 },
              c = { fg = catppuccin_colors.text, bg = catppuccin_colors.mantle },
            },
            insert = { a = { fg = catppuccin_colors.crust, bg = catppuccin_colors.blue, gui = "bold" },},
            visual = { a = { fg = catppuccin_colors.crust, bg = catppuccin_colors.lavender, gui = "bold" },},
            replace = { a = { fg = catppuccin_colors.crust, bg = catppuccin_colors.red, gui = "bold" },},
            command = { a = { fg = catppuccin_colors.crust, bg = catppuccin_colors.peach, gui = "bold" },},
            inactive = {
              a = { fg = catppuccin_colors.overlay0, bg = catppuccin_colors.crust, gui = "bold" },
              b = { fg = catppuccin_colors.overlay0, bg = catppuccin_colors.mantle },
              c = { fg = catppuccin_colors.overlay0, bg = catppuccin_colors.mantle },
            },
          },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
          lualine_b = {
            { "branch", icon = "", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
            { "diff", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
          lualine_c = {
            { "filename", path = 1, separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              separator = { left = "", right = "" },
              padding = { left = 1, right = 1 },
            },
            },
          lualine_y = {
            { "filetype", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            { "progress", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
      })
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() 
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "thick",
          always_show_bufferline = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or level:match("warning") and " " or " "
            return icon .. count
          end,
          offsets = {
            { filetype = "NvimTree", text = "File Explorer", highlight = "Directory" }
          },
          hover = {
            enabled = true,
            delay = 100,
            reveal = {'close'}
          },
          custom_filter = function(buf)
            return vim.bo[buf].filetype ~= "NvimTree"
          end
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      })
    end
  },

  require("plugins.indent"), 

  {
    "swaits/universal-clipboard.nvim",
    opts = {
      verbose = false,
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
