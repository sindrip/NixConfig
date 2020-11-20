{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "/nixpkgs";
    };
  };

  outputs = { self, ... }@inputs: {

    homeManagerConfigurations = {
      me = inputs.home-manager.lib.homeManagerConfiguration {
        configuration = ./home;
        system = "x86_64-linux";
        homeDirectory = "/home/sindrip";
        username = "sindrip";
      };
    };

    defaultPackage.x86_64-linux = self.homeManagerConfigurations.me.activationPackage;

  };
}
