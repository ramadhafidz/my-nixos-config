{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  #programs.git = {
  #  enable = true;
  #  config = {
  #    user = {
  #      name = "ramadhafidz";
	#      email = "hrghiffari@gmail.com";
  #    }; 
  #  };
  #  extraConfig = {
  #    credential.helper = "manager";
  #    credential."https://github.com".username = "ramadhafidz";
  #    credential.credentialStore = "cache";
  #  };
  #};
}
