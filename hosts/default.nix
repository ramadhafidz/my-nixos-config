{ config, lib, inputs, system, pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix

    ./modules/environtment.nix
    ./modules/services.nix
    ./modules/packages.nix
    ./modules/bootloader.nix
    ./modules/fonts.nix
    ./modules/programs.nix
    ./modules/user.nix
    ./modules/nix-features.nix
  ];

  environment.systemPackages = [
    (inputs.home-manager.packages.${system}.default)
  ];

  networking.networkmanager.enable = true;

  networking.hostName = "nixos";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
