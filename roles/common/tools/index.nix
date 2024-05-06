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
    # vexctl -- nixos version is very old, install from `go install github.com/openvex/vexctl@latest`

    # Documentation
    plantuml
  ];
}

