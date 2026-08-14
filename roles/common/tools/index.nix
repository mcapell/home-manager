{ config, pkgs, ... }:

let
  llm-with-plugins = pkgs.unstable.llm.withPlugins {
    llm-gemini = true;
  };
in
{
  home.packages = with pkgs; [
    # General
    git  # git usually already exists, but defining it here will make it available in nix-shells
    jq
    yq-go
    gh
    difftastic
    direnv
    gnupg
    ripgrep
    jwt-cli
    fzf
    pet  # snippet manager
    pass

    # Containers & cloud native tools
    skopeo
    crane
    # vexctl -- nixos version is very old, install from `go install github.com/openvex/vexctl@latest`
    sops
    # cloudflared
    minikube
    pkgs.unstable.tilt  # stable failed to built on macOS (due to some issue building node v20.19)
    kubernetes-helm
    ko # build containers for Go apps
    kubectl

    # Documentation
    plantuml

    # Cloud providers
    # awscli2
    terraform

    # Network
    tshark

    # LLMs
    llm-with-plugins
    pkgs.unstable.sandbox-runtime
  ];

  home.file.".gitconfig" = {
    source = ./git/gitconfig;
  };

}
