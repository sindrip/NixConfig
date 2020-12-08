{config, pkgs, ...}:

{
  home.stateVersion = "20.09";

  home.packages = [
    pkgs.home-manager
    pkgs.cachix

    # Terminal
    pkgs.git
    pkgs.starship
    pkgs.tmux
    pkgs.direnv
    pkgs.fzf
    pkgs.bat
    pkgs.gitAndTools.delta

    # LSP
    pkgs.rust-analyzer
    pkgs.texlab

    #Other
    pkgs.zotero
    pkgs.zathura
  ];

  programs.tmux.enable = true;

  xdg.configFile = {
    "ideavim/ideavimrc".source = ./dotconfig/ideavim/ideavimrc;
    "nix/nix.conf".source = ./dotconfig/nix/nix.conf;
  };

}

