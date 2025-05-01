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
    zsh nixd ranger
    zsh-autosuggestions
    plasma5Packages.kdeconnect-kde
    vscode
  ];

  systemd.user.services.kdeconnect-indicator = {
    Unit = {
      Description = "KDE Connect Indicator";
      After = [ "network.target" ];
    };

    Service = {
      ExecStart = "${pkgs.plasma5Packages.kdeconnect-kde}/bin/kdeconnect-indicator";
      Restart = "always";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
