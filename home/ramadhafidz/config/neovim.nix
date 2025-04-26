{ pkgs, ... }:

{
  imports = [ ./neovim ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # LSP
      nodePackages.intelephense
      nodePackages.typescript-language-server
      vscode-langservers-extracted
      pyright
      clangd
      
      # Tools
      ripgrep
      fd
      lua-language-server
      nil
      phpactor
    ];
  };
}
