{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # LSP Servers
      nodePackages.intelephense  # PHP/Laravel
      nodePackages.typescript-language-server  # JavaScript
      vscode-langservers-extracted  # HTML/CSS
      pyright           # Python
      clang-tools       # C++
      
      # Tools pendukung
      ripgrep
      fd
      lua-language-server
      nil
      phpactor
    ];

    extraLuaConfig = ''
      -- Setup Lazy.nvim
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)

      -- Konfigurasi dasar
      vim.g.mapleader = " "
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true

      -- Setup plugin dengan Lazy.nvim
      require("lazy").setup({
        -- LSP
        {
          "neovim/nvim-lspconfig",
          dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
          },
          config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
              ensure_installed = {
                "nixd",
                "intelephense",
                "ts_ls",
                "html",
                "cssls",
                "pyright",
                "clangd",
              }
            })

            local lsp = require("lspconfig")
            local on_attach = function(client, bufnr)
              -- Keymaps LSP
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
              vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
            end

            -- Setup LSP untuk semua bahasa
            lsp.nixd.setup({ on_attach = on_attach })
            lsp.intelephense.setup({ on_attach = on_attach })
            lsp.tsserver.setup({ on_attach = on_attach })
            lsp.html.setup({ on_attach = on_attach })
            lsp.pyright.setup({ on_attach = on_attach })
            lsp.clangd.setup({ on_attach = on_attach })
          end
        },

        -- Autocompletion
        {
          "hrsh7th/nvim-cmp",
          dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
          },
          config = function()
            local cmp = require("cmp")
            cmp.setup({
              snippet = {
                expand = function(args)
                  require("luasnip").lsp_expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
              }),
              sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
              }, {
                { name = "buffer" },
              })
            })
          end
        },

        -- Untuk PHP/Laravel
        {
          "adalessa/laravel.nvim",
          dependencies = {
            "nvim-telescope/telescope.nvim",
          },
          config = function()
            require("laravel").setup()
            require("telescope").load_extension("laravel")
          end
        },

        -- Tampilan
        {
          "catppuccin/nvim",
          name = "catppuccin",
          priority = 1000,
          config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
          end,
        },
        {
          "nvim-lualine/lualine.nvim",
          dependencies = { "nvim-tree/nvim-web-devicons" },
          config = true,
        },
      })
    '';
  };
}
