{ pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # LSP Servers
      nixd               # Nix
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
      -- Setup Lazy.nvim dan konfigurasi LSP
      -- (Sama seperti contoh sebelumnya)
      ${builtins.readFile ./init.lua}
    '';
  };

  # File init.lua bisa dipisah jika prefer
  home.file.".config/nvim/init.lua".source = ./init.lua;
}
