{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = { self, nixpkgs, flake-utils, nixos-hardware, home-manager, textfox, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        packages.default = pkgs.hello;
      }
    ) // {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { 
            inherit inputs;
          };
          modules = [
            ./hosts/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = "backup";
                users.ramadhafidz = {
                  imports = [
                    ./home/ramadhafidz/home.nix
                    textfox.homeManagerModules.default
                  ];
                  home = {
                    username = "ramadhafidz";
                    homeDirectory = "/home/ramadhafidz";
                    stateVersion = "24.11";
                  };
                };
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
