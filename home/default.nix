{config, pkgs, ...}:

{
  home.stateVersion = "20.09";

  home.packages = [
    #pkgs.tmux
    pkgs.home-manager
    pkgs.direnv
    pkgs.rust-analyzer
  ];

  programs.tmux.enable = true;

  #xdg.enable = true;
  xdg.configFile = {
    "ideavim/ideavimrc".source = ./dotconfig/ideavim/ideavimrc;
    "nix/nix.conf".source = ./dotconfig/nix/nix.conf;
  };

}

