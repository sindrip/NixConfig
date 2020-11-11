{
  description = "A very basic flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      unstable-pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
  {

    packages.x86_64-linux.myPackages = unstable-pkgs.buildEnv {
      name = "myPackages";
      paths = [
        unstable-pkgs.direnv
        unstable-pkgs.rust-analyzer
      ];
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.myPackages;

  };
}
