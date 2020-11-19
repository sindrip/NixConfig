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
          configuration = ./home.nix;
          system = "x86_64-linux";
          homeDirectory = "/home/sindrip";
          username = "sindrip";
        };
      };

    #packages.x86_64-linux.myPackages = unstable-pkgs.buildEnv {
    #  name = "myPackages";
    #  paths = [
    #    unstable-pkgs.rust-analyzer
    #  ];
    #};

    #defaultPackage.x86_64-linux = self.packages.x86_64-linux.myPackages;

  };
}
