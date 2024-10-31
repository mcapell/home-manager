{ config, pkgs, ... }:

let
  isDarwin = builtins.currentSystem == "x86_64-darwin";
  isLinux = builtins.currentSystem == "x86_64-linux";

  osEntryPoint = if isDarwin then
    import ./roles/darwin/index.nix
  else if isLinux then
    import ./roles/linux/index.nix
  else
    {};

in
{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import <nixpkgs-unstable> { };
  };

  programs.home-manager.enable = true;


  imports = [
    osEntryPoint
  ];
}
