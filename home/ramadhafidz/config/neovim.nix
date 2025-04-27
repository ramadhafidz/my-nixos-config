{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # LSP
      nodePackages.intelephense
      nodePackages.typescript-language-server
      vscode-langservers-extracted
      pyright nil
      lua-language-server
      
      # Tools
      ripgrep
      fd
      phpactor
      prettier
      shfmt
    ];
  };

  home.file.".config/nvim/init.lua".source = ./neovim/init.lua;
  home.file.".config/nvim/lua".source = ./neovim/lua;
}
