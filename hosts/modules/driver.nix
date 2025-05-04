{ lib, pkgs, config, ... }:

with lib; let
  cfg = config.drivers.intel;
in {
  options.drivers.intel = {
    enable = mkEnableOption "Enable Intel Graphic Drivers";
  };

  config = mkIf cfg.enable {
    hardware.graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}

# https://gitlab.com/Zaney/zaneyos/-/tree/main?ref_type=heads
