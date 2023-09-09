{ config, pkgs, ... }:

{
  home.username = "marc";
  home.homeDirectory = "/Users/marc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  imports = [
    ./roles/darwin/index.nix
  ];
}
