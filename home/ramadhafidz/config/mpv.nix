{ config, pkgs, lib, ... }:

{
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "vaapi";
      vo = "gpu";
      profile = "fast";
      save-position-on-quit = true;
      osc = "no";
      border = "no";
    };

    bindings = {
      "ALT+ENTER" = "cycle fullscreen";
      "ctrl+LEFT" = "add chapter -1";
      "ctrl+RIGHT" = "add chapter 1";
    };

    scripts = with pkgs.mpvScripts; [
      thumbfast
      uosc mpris
    ];

    scriptOpts = {
      thumbfast = {
        socket = "";
        thumbnail = "${config.home.homeDirectory}/.cache/mpv/thumbfast";
        max_height = 200;
        max_width = 200;
        scale_factor = 1;
        tone_mapping = "auto";
        overlay_id = 42;
        spawn_first = "yes";
        quit_after_inactivity = 0;
        network = "no";
        audio = "no";
        hwdec = "no";
        direct_io = "no";
        mpv_path = "mpv";
      };
    };
  };

  home.packages = with pkgs; [
    ffmpeg-full ffmpegthumbnailer jq imagemagick
    libva-utils
  ];

  systemd.user.tmpfiles.rules = [
    "d ${config.home.homeDirectory}/.cache/mpv/thumbfast 0755 - - -"
  ];
}
