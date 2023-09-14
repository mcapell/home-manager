{ config, pkgs, users, ... }:

{
  home.packages = with pkgs; [
    alacritty
    zellij
  ];

  home.file.".alacritty.yml" = {
    source = ./alacritty/alacritty.yml;
  };

  programs.fish.enable = true;
  xdg.configFile.fish = {
    source = ./fish;
    recursive = true;
  };
}
