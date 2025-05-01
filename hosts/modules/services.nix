{ config, pkgs, lib, ... }:

{
  # MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    dataDir = "/var/lib/mysql";
    settings.mysqld = {
      bind-address = "127.0.0.1";
      port = 3306;
    };
  };

  # Upower
  services.upower = {
    enable = true;
    # usePrecentageForPolicy = true;
    # criticalPowerAction = "hibernate";
  };

  # Pipewire (Audio)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Display Manager
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
    };
  };

  services.xserver.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
