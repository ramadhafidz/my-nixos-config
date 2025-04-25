{ config, pkgs, ... }:

{
  users.users.ramadhafidz = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree firefox kitty waybar neovim git
    ];
  };
}
