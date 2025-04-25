{ config, pkgs, lib, ... }:

let
  thumbfast = pkgs.mpvScripts.thumbfast.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "po5";
      repo = "thumbfast";
      rev = "9deb0733c4e36938cf90e42ddfb7a19a8b2f4641";
      hash = "sha256-avG1CRBrs0UM4HcFMUVAQyOtcIFkZ/H+PbjZJKU7o2A=";
    };
  });

  my-mpv = pkgs.mpv.override {
    scripts = [ thumbfast ];
  };

in {
  programs.mpv = {
    enable = true;
    package = my-mpv;

    config = {
      save-position-on-quit = true;
      
      script-opts = "thumbfast-network=yes,thumbfast-colorspace=auto,thumbfast-columns=10,thumbfast-hover_delay=0.2,thumbfast-max_height=160,thumbfast-max_width=320,thumbfast-seek_offset=1,thumbfast-title_prefix=[PREVIEW]";
    };

    bindings = {
      "ctrl+d" = "script-binding thumbfast";
      "ALT+ENTER" = "cycle fullscreen";
      "ctrl+LEFT" = "add chapter -1";
      "ctrl+RIGHT" = "add chapter 1";
    };
  };
}
