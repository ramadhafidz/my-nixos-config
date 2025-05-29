{ config, pkgs, ... }:

{
  users.users.ramadhafidz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh; 
  };
}
