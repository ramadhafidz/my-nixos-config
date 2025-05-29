{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [ 
      ripgrep
      shfmt
    ];
  };

  home.file.".config/nvim/init.lua".source = ./neovim/init.lua;
  home.file.".config/nvim/lua".source = ./neovim/lua;
}
