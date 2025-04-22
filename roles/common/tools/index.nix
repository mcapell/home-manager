{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # General
    jq
    yq-go
    gh
    difftastic
    direnv
    gnupg
    ripgrep
    jwt-cli
    fzf

    # Containers & cloud native tools
    skopeo
    crane
    # vexctl -- nixos version is very old, install from `go install github.com/openvex/vexctl@latest`
    sops
    # cloudflared
    minikube

    # Documentation
    plantuml

    # Cloud providers
    # awscli2
  ];

  home.file.".gitconfig" = {
    source = ./git/gitconfig;
  };

}

