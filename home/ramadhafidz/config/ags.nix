{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
    font-awesome
  ];

  xdg.configFile."ags".source = ./ags; 
}
