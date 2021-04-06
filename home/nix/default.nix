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
    pkgs.fd
    pkgs.gitAndTools.delta
    pkgs.neovim-nightly
    pkgs.neovim-remote
    pkgs.tree
    (pkgs.nerdfonts.override {fonts = [ "Iosevka" ]; })

    # Java
    pkgs.jdk
    pkgs.maven

    # LSP
    pkgs.texlab
    pkgs.sumneko-lua-language-server

    #Other
    pkgs.zathura
  ];

  xdg.configFile = {
  };

  fonts.fontconfig.enable = true;

}
