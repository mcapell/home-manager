{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    zellij
    fish
  ];

  home.file.".alacritty.yml" = {
    source = ./alacritty/alacritty.yml;
  };
}
