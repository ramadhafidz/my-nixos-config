{ config, lib, pkgs, ... }:

let
  sddm-astronaut-theme = import ./pkgs/sddm-astronaut-theme.nix {
    inherit (pkgs) lib stdenvNoCC fetchFromGitHub formats;
    kdePackages = pkgs.kdePackages;
    theme = "ghost";
    themeConfig = {
      General = {
        showUserName = true;
      };
    };
  };
in {
  imports = [
    ./hardware-configuration.nix

    ./modules/bootloader.nix
    ./modules/desktop.nix
    ./modules/fonts.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/user.nix
    ./modules/nix-features.nix
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
