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
  programs.fish.enable = true;
  xdg.configFile.fish = {
    source = ./fish;
    recursive = true;
  };
  #
  # xdg.configFile.kitty = {
  #   source = ./kitty;
  #   recursive = true;
  # };

  xdg.configFile.zellij = {
    source = ./zellij;
    recursive = true;
  };
}
