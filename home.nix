{ config, pkgs, lib, ... }:

let
  system = builtins.currentSystem;

  osEntryPoint = if system == "aarch64-darwin" then
    import ./roles/darwin/index.nix
  else if system == "x86_64-linux" then
    import ./roles/linux/index.nix
  else
    {};
in
{
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      unstable = import <nixpkgs-unstable> {
         allowUnfree = true;
      };
    };
  };

  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  imports = [
    osEntryPoint
  ];
}
