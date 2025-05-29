{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (flakeSystem: # Mengganti nama variabel 'system' di sini agar tidak ambigu
      let
        pkgs = import nixpkgs {
          system = flakeSystem; # Menggunakan variabel dari eachDefaultSystem
          config.allowUnfree = true;
        };
      in
      {
        packages.default = pkgs.hello;
      }
    ) // {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Mendefinisikan sistem untuk konfigurasi NixOS ini
        specialArgs = { inherit inputs; system = "x86_64-linux"; }; # Meneruskan 'inputs' dan 'system' ke modul NixOS
        modules = [
          ./hosts/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              users.ramadhafidz = import ./home/ramadhafidz/home.nix;
              # 'system' akan tersedia untuk home.nix di sini dari specialArgs nixosSystem
              extraSpecialArgs = { inherit inputs; }; 
            };
          }
        ];
      };

      homeConfigurations."ramadhafidz@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = (import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; });
        # Meneruskan 'inputs' DAN 'system' ke modul Home Manager
        extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; }; # <-- PERUBAHAN DI SINI
        modules = [
          ./home/ramadhafidz/home.nix
          {
            home = {
              username = "ramadhafidz";
              homeDirectory = "/home/ramadhafidz";
              stateVersion = "24.11";
            };
          }
        ];
      };
    };
}
