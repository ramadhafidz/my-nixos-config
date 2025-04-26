{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Dev tools
    php84
    php84Packages.composer
    python313
    nodejs_23

    # Databases
    mariadb

    # Utils
    git
    wget
    htop
    unzip
    upower

    # nixpkgs
    nix-prefetch-github
  ];
}
