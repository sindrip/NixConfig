{config, pkgs, ...}:

{
  home.stateVersion = "20.09";

  home.packages = [
    pkgs.rust-analyzer
    pkgs.hello
  ];
}
