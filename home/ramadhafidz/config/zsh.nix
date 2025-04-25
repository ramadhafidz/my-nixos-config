{ config, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
	"sudo"
	"z"
      ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
    };

    shellAliases = {
      ll = "ls -alF";
      la = "ls -a";
      ".." = "cd ..";
      rebuild-nix = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    };
  };
}
