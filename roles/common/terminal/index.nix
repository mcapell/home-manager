{ config, pkgs, users, ... }:

{
  # kitty and alacritty have issues with OpenGL when installed from home-manager
  home.packages = with pkgs; [
    pkgs.unstable.fish
    # alacritty
    # pkgs.unstable.ghostty
    zellij
    # kitty
    # nerdfonts
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.unstable.nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  # home.file.".alacritty.yml" = {
  #   source = ./alacritty/alacritty.yml;
  # };
  #
  programs.fish = {
    enable = true;
    shellInit = import ./fish/config.fish.nix {
      inherit pkgs;
    };
  };

  home.file.".config/fish/functions" = {
    source = ./fish/functions;
    recursive = true;
  };

  # xdg.configFile.kitty = {
  #   source = ./kitty;
  #   recursive = true;
  # };

  # xdg.configFile.zellij = {
  #   source = ./zellij;
  #   recursive = true;
  # };

  home.file.".config/zellij/config.kdl".source = pkgs.substituteAll {
    src = ./zellij/config.kdl.in;
    fish = "${pkgs.fish}/bin/fish";
  };
}
