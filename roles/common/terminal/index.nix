{ config, pkgs, users, ... }:

{
  home.packages = with pkgs; [
    alacritty
    zellij
    kitty
  ];

  home.file.".alacritty.yml" = {
    source = ./alacritty/alacritty.yml;
  };

  programs.fish.enable = true;
  xdg.configFile.fish = {
    source = ./fish;
    recursive = true;
  };

  xdg.configFile.kitty = {
    source = ./kitty;
    recursive = true;
  };

  xdg.configFile.zellij = {
    source = ./zellij;
    recursive = true;
  };
}
