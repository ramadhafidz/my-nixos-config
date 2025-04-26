{ config, inputs, ... }:

{
  imports = [
    inputs.textfox.homeManagerModules.default
  ];

  textfox = {
    enable = true;
    profile = "34admilz.default";
    config = {
      background.color = "#000000";
      border = {
        color = "#b30e21";
        width = "2px";
        transition = "1.0s ease";
        radius = "3px";
      };
      tabs = {
        horizontal.enable = false;
        vertical.margin = "1.0rem";
      };
      displayWindowControls = false;
      displayNavButtons = true;
      displayUrlbarIcons = false;
      displaySidebarTools = true;
      displayTitles = true;
      newtabLogo = ''   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  '';
      font = {
        family = "Fira Code";
        size = "15px";
        accent = "#f0f0f0";
      };
    };
  };
}
