{ config, pkgs, ... }:

{
  home.username = "marc";
  home.homeDirectory = "/Users/marc";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import <nixpkgs-unstable> { };
  };

  programs.home-manager.enable = true;

  imports = [
    ./roles/darwin/index.nix
  ];
}
