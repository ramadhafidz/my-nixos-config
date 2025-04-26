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

  zramSwap = {
    enable = true;
    memoryPercent = 100;
    algorithm = "zstd";
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.vfs_cache_pressure" = 50;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
  };

  swapDevices = [ ];

  networking.networkmanager.enable = true;

  networking.hostName = "nixos";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
