{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Dev tools
    php84
    php84Packages.composer
    python313
    nodejs_23
    gcc gnumake

    # Databases
    mariadb

    # Utils
    git
    wget
    htop
    unzip
    upower
    brightnessctl
    playerctl
    exfatprogs
    ripgrep

    # nixpkgs
    nix-prefetch-github
  ];
}
