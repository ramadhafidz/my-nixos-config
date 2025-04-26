{ config, pkgs, inputs, ... }:

{
  home.username = "ramadhafidz";
  home.homeDirectory = "/home/ramadhafidz";
  home.stateVersion = "24.11";

  imports = [
    ./config/zsh.nix
    ./config/mpv.nix
    ./config/hyprland.nix
    ./config/neovim.nix
    ./config/textfox.nix
  ];

  home.packages = with pkgs; [
    kitty ags
    discord
    neofetch grim
    slurp wl-clipboard
    zsh nixd
    zsh-autosuggestions
  ];
}
