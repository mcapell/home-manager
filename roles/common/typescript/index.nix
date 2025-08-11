{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NPM_CONFIG_PREFIX = "$HOME/.node";
  };

  home.packages = with pkgs; [
    pkgs.unstable.nodejs_22
  ];
}
