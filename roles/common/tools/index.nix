{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    jq
    gh
    difftastic

    # Containers
    skopeo
    crane
  ];
}

