return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim"  -- Untuk highlight delimiter warna-warni
    },
    config = function()
      -- 1. Setup warna rainbow
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      
      -- 2. Definisi highlight groups
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      -- 3. Konfigurasi indent-blankline
      require("ibl").setup({
        indent = {
          char = "▏",
          highlight = highlight,  -- Pakai warna rainbow untuk indent
        },
        scope = {
          highlight = highlight,  -- Warna-warni untuk scope
          show_start = false,     -- Sembunyikan garis awal scope
        },
        exclude = {
          filetypes = { "help", "NvimTree", "dashboard", "lazy" }
        }
      })

      -- 4. Integrasi rainbow delimiters
      require("rainbow-delimiters.setup")({
        highlight = highlight
      })

      -- 5. Animasi scope highlight (opsional)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  }
}
