return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Tambahan untuk PHP & Tailwind
      {'adalessa/laravel.nvim'}, -- (Opsional) Untuk Laravel artisan commands
    },
    config = function()
      local lsp_zero = require('lsp-zero').preset({})

      -- Konfigurasi LSP
      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
        -- Keymaps tambahan untuk PHP/Laravel
        vim.keymap.set('n', '<leader>la', ':Laravel artisan<CR>', {buffer = bufnr}) -- Jika menggunakan laravel.nvim
      end)

      -- Install LSP server via Mason
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'intelephense',      -- PHP (Laravel)
          'tailwindcss',       -- Tailwind CSS
          'html',             -- Untuk Blade (opsional)
          'emmet_ls',         -- Untuk mempercepat HTML/CSS (opsional)
        },
        handlers = {
          lsp_zero.default_setup,
          -- Konfigurasi khusus untuk intelephense (PHP)
          intelephense = function()
            require('lspconfig').intelephense.setup({
              settings = {
                intelephense = {
                  environment = {
                    includePaths = { 'vendor/laravel/framework' }, -- Untuk Laravel
                  },
                  files = {
                    maxSize = 5000000, -- Ukuran file maksimal (untuk file Laravel besar)
                  },
                },
              },
            })
          end,
          -- Konfigurasi khusus untuk Tailwind
          tailwindcss = function()
            require('lspconfig').tailwindcss.setup({
              settings = {
                tailwindCSS = {
                  experimental = {
                    classRegex = {
                      -- Support untuk Laravel Blade
                      {'class="([^"]*)"', 'class=\'([^\']*)\''},
                      {'@apply\\(([^)]*)\\)', "'[^']*'|\"[^\"]*\""},
                    },
                  },
                },
              },
            })
          end,
        },
      })

      -- Setup Autocompletion (nvim-cmp)
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
          {name = 'buffer'},
          {name = 'path'},
          {name = 'luasnip'},
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm({select = true}),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end
  },
}
