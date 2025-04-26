{ pkgs, lib, ... }:

let
  luaConfigFiles = lib.cleanSourceWith {
    src = lib.cleanSource ./.;
    filter = name: type:
      let baseName = baseNameOf (toString name);
      in lib.hasSuffix ".lua" baseName;
  };
in
{
  programs.neovim = {
    extraLuaConfig = ''
      -- Load main config
      ${lib.fileContents ./init.lua}
    '';

    extraConfig = ''
      " Load any vimscript config if needed
    '';

    # Copy semua file Lua ke direktori yang tepat
    extraPackages = [ (pkgs.runCommand "neovim-lua-config" {} ''
      mkdir -p $out/lua
      cp -r ${luaConfigFiles}/lua/* $out/lua/
    '') ];
  };
}
