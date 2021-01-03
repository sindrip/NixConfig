{ config, pkgs, ...}:

{
  imports = [
    ./alacritty.nix
  ];

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
    pkgs.neovim-nightly
    pkgs.tree

    # LSP
    pkgs.texlab

    #Other
    pkgs.zotero
    pkgs.zathura
  ];

  programs.tmux.enable = true;

  xdg.configFile = {
  };

}

