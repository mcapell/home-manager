{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.go
    pkgs.unstable.gotools  # provides goimports
    pkgs.unstable.golangci-lint
    pkgs.unstable.delve

    # Tools
    pkgs.unstable.go-task
    pkgs.unstable.mage
  ];
}

