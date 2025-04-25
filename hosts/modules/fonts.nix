{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (pkgs.stdenv.mkDerivation {
        name = "customFonts";
	src = ../fonts;
	installPhase = ''
          mkdir -p $out/share/fonts/truetype
	  cp *.ttf $out/share/fonts/truetype/
	'';
      })
    ];
  };
}
