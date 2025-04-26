{ config, pkgs, inputs, ... }:
{
  programs.textfox = {
    enable = true;
    profile = "34admilz.default";  # Menggunakan nama profile yang benar
    config = {
      background.color = "#123456";
      border = {
        color = "#654321";
        width = "4px";
        transition = "1.0s ease";
        radius = "3px";
      };
      displayHorizontalTabs = true;
      displayWindowControls = true;
      displayNavButtons = true;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = false;
      newtabLogo = ''   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  '';
      font = {
        family = "Fira Code";
        size = "15px";
        accent = "#654321";
      };
      sidebery.margin = "1.0rem";
    };
  };
}
