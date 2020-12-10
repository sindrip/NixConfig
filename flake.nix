{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim-nightly-overlay.url = "github:mjlbach/neovim-nightly-overlay";

    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "/nixpkgs";
    };
  };

  outputs = { self, ... }@inputs: {

    homeManagerConfigurations = {
      me = inputs.home-manager.lib.homeManagerConfiguration {
        configuration = {...}: {
          nixpkgs.overlays = [
            inputs.neovim-nightly-overlay.overlay
          ];
          imports = [
            ./home
          ];
        };
        #configuration = ./home;
        system = "x86_64-linux";
        homeDirectory = "/home/sindrip";
        username = "sindrip";
      };
    };

    defaultPackage.x86_64-linux = self.homeManagerConfigurations.me.activationPackage;

  };
}
