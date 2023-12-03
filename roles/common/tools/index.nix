{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    jq
    gh
    difftastic
    direnv

    # Containers
    skopeo
    crane

    # Documentation
    plantuml
  ];
}

