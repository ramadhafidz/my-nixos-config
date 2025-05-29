{ config, pkgs, inputs, system, ... }:

let
  system = "x86_64-linux";
in {
  home.username = "ramadhafidz";
  home.homeDirectory = "/home/ramadhafidz";
  home.stateVersion = "24.11";

  imports = [
    ./config/zsh.nix
    ./config/mpv.nix
    ./config/hyprland.nix
    ./config/neovim.nix
    ./config/textfox.nix
    ./config/ags.nix
  ];

  home.packages = with pkgs; [
    kitty ags
    discord
    neofetch grim
    slurp wl-clipboard
    zsh nixd ranger
    zsh-autosuggestions
    plasma5Packages.kdeconnect-kde
    vscode unrar jasp-desktop
    inputs.zen-browser.packages."${system}".beta
  ];

  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "ramadhafidz";
        email = "hrghiffari@gmail.com"; 
      };
      credential.helper = "manager";
      credential."https://github.com".username = "ramadhafidz"; 
    };
  };
}
