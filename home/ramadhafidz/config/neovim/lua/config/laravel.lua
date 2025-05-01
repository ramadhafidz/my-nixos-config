return {
  -- Blade Formatter
  {
    "emranovi/blade-formatter.nvim",
    ft = "blade",
    url = "git@github.com:emranovi/blade-formatter.nvim.git",
    config = function()
      require("blade-formatter").setup({
        indent_size = 4,
        wrap_line_length = 120,
      })
    end
  },

  -- Telescope Laravel
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Artisan", "Composer", "Npm", "Yarn" },
    config = function()
      require("telescope").load_extension("laravel")
    end
  }
}
