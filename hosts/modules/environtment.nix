{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";
}
