{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.nodejs_22
  ];
}


