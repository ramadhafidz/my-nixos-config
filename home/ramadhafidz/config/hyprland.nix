#                          _                 _ 
#   /\  /\_   _ _ __  _ __| | __ _ _ __   __| |
#  / /_/ / | | | '_ \| '__| |/ _` | '_ \ / _` |
# / __  /| |_| | |_) | |  | | (_| | | | | (_| |
# \/ /_/  \__, | .__/|_|  |_|\__,_|_| |_|\__,_|
#         |___/|_|     

{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";
      
      env = [
        "XCURSOR_SIZE,15";
	"HYPRCURSOR_SIZE,15";
      ];

      general = {
        gaps_in = 5;
	gaps_out = 20;
	border_size = 2;
	col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	col.inactive_border = "rgba(595959aa)";
	resize_on_border = false;
	allow_tearing = false;
	layout = dwindle;
      };

      decoration {
        rounding = 10;
	active_opacity = 1.0;
	inactive_opacity = 1.0;

	shadow = {
          enabled = true;
	  range = 4;
	  render_power = 3;
	  color = rgba(1a1a1aee);
	};

	blur = {
          enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy  = 0.1696;
	};
      };

      animations = {
        enabled = true;
	bezier = {
          "easeOutQuint,0.23,1,0.32,1"
	  "easeInOutCubic,0.65,0.05,0.36,1"
	  "linear,0,0,1,1"
	  "almostLinear,0.5,0.5,0.75,1.0"
	  "quick,0.15,0,0.1,1"
	};
	animation = [
          "global, 1, 10, default"
	  "border, 1, 5.39, easeOutQuint"
	];
      };

      input = {
        kb_layout = "us";
	follow_mouse = 1;
	sensitivity = 0;
	touchpad.natural_scroll = true;
      };
    };
  };
}
