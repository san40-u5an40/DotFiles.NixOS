{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zapret.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, cursor, noctalia, stylix, nur, zapret, ... }:
    let
      system = "x86_64-linux";
      user = "san40-u5an40";
      hostName = "${user}-nixos";
      stateVersion = "26.05";
      historyLength = 30000;
      profileInfo = { inherit system historyLength user hostName stateVersion; };

      config = {
        allowUnfree = true;
        rocmSupport = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        inherit config;
      };
      upkgs = import nixpkgs-unstable {
        inherit system;
        inherit config;
      };
    in
    {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        inherit system;
        inherit pkgs;
        specialArgs = { inherit profileInfo upkgs; };
        modules = [
          ./nixOs/configuration.nix
          zapret.nixosModules.default
        ];
      };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit upkgs profileInfo cursor noctalia nur; };
        modules = [
          ./home-manager/home.nix
          stylix.homeModules.stylix
          noctalia.homeModules.default
          nur.modules.homeManager.default
        ];
      };
    };
}
