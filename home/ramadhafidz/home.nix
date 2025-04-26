{ config, pkgs, inputs, ... }:

{
  home.username = "ramadhafidz";
  home.homeDirectory = "/home/ramadhafidz";
  home.stateVersion = "24.11";

  imports = [
    ./config/zsh.nix
    ./config/mpv.nix
    ./config/hyprland.nix
    inputs.textfox.homeManagerModules.default
  ];

  textfox = {
    enable = true;
    profile = "34admilz.default";
    config = {
      background.color = "#000000";
      border = {
        color = "#b30e21";
        width = "2px";
        transition = "1.0s ease";
        radius = "3px";
      };
      tabs = {
        horizontal.enable = false;  # Ganti dari displayHorizontalTabs
        vertical.margin = "1.0rem";  # Ganti dari sidebery.margin
      };
      displayWindowControls = true;
      displayNavButtons = true;
      displayUrlbarIcons = false;
      displaySidebarTools = true;
      displayTitles = true;
      newtabLogo = ''   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  '';
      font = {
        family = "Fira Code";
        size = "15px";
        accent = "#f0f0f0";
      };
    };
  };

  home.packages = with pkgs; [
    vim neovim
    kitty ags
    discord
    neofetch grim
    slurp wl-clipboard
    zsh
    zsh-autosuggestions
  ];
}
