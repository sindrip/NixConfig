{config, pkgs, ...}:

{
  home.stateVersion = "20.09";

  home.packages = [
    #pkgs.tmux
    pkgs.direnv
    pkgs.rust-analyzer
  ];


  #xdg.enable = true;
  #xdg.configFile = {
  #  "ideavim/ideavimrc".source = "./dotconfig/ideavim/ideavimrc";
  #};

}

