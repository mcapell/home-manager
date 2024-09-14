{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    jq
    gh
    difftastic
    direnv
    gnupg
    ripgrep
    jwt-cli
    fzf

    # Containers
    skopeo
    crane
    # vexctl -- nixos version is very old, install from `go install github.com/openvex/vexctl@latest`

    # Documentation
    plantuml

    # Cloud providers
    awscli2
  ];

  home.file.".gitconfig" = {
    source = ./git/gitconfig;
  };

}

