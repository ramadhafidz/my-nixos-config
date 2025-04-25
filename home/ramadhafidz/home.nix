{ config, pkgs, ... }:

{
  home.username = "ramadhafidz";
  home.homeDirectory = "/home/ramadhafidz";
  home.stateVersion = "24.11";

  imports = [
    ./config/zsh.nix
    ./config/mpv.nix
  ];

  home.packages = with pkgs; [
    vim neovim
    kitty ags
    discord
    neofetch grim
    slurp wl-clipboard
    zsh firefox
    zsh-autosuggestions
  ];
}
