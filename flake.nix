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
    ags-latest = {
      url = "github:Aylur/ags/v2.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, nixos-hardware, home-manager, textfox, ags-latest, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # pkgs ini untuk output 'packages.default' dari flake-mu
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true; # Sesuai konfigurasi awalmu
        };
      in
      {
        packages.default = pkgs.hello; # Sesuai konfigurasi awalmu
      }
    ) // {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # 
        specialArgs = {
          inherit inputs; # Termasuk nixos-hardware, textfox, zen-browser
          system = "x86_64-linux"; # 
          # pkgs tidak secara eksplisit didefinisikan di specialArgs awalmu di sini,
          # Home Manager dengan useGlobalPkgs = true akan mengambil pkgs dari sistem NixOS,
          # yang mana config.allowUnfree = true sudah diatur di hosts/default.nix 
        };
        modules = [
          ./hosts/default.nix
          # Jika kamu menggunakan modul dari nixos-hardware secara spesifik,
          # kamu bisa menambahkannya di sini. Jika tidak, baris ini bisa dikomentari/dihapus
          # untuk menghindari error 'attribute default missing' jika tidak ada modul default yang cocok.
          # nixos-hardware.nixosModules.default
          home-manager.nixosModules.home-manager # 
          {
            home-manager = {
              useUserPackages = true; # 
              useGlobalPkgs = true; # 
              backupFileExtension = "backup"; # 
              users.ramadhafidz = import ./home/ramadhafidz/home.nix; # 
              extraSpecialArgs = { inherit inputs; }; # 
            };
          }
        ];
      }; # 

      homeConfigurations."ramadhafidz@nixos" = home-manager.lib.homeManagerConfiguration {
        # Mengembalikan ke penggunaan legacyPackages sesuai konfigurasi awalmu
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # 
        extraSpecialArgs = { inherit inputs; }; # 
        modules = [
          ./home/ramadhafidz/home.nix # 
          {
            home = {
              username = "ramadhafidz"; # 
              homeDirectory = "/home/ramadhafidz"; # 
              stateVersion = "24.11"; # 
            };
          }
        ];
      }; # 
    };
}
