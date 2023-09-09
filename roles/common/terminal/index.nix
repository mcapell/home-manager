{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    zellij
    fish
  ];
}
