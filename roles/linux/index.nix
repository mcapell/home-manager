{ config, pkgs, ... }:

{
    home.username = "marc";
    home.homeDirectory = "/home/marc";

    # Override Determinate Nix's system nixpkgs weekly path with this
    # channel-based configuration's matching nixpkgs release.
    nix.settings.nix-path =
      "nixpkgs=${config.home.homeDirectory}/.nix-defexpr/channels/nixpkgs";

    home.packages = with pkgs; [
        gcc
        libglvnd
        mesa
        gnumake

        nicotine-plus # music download
    ];

    imports = [
       ../common/tools/index.nix
       ../common/terminal/index.nix
       ../common/editor/index.nix
       ../common/productivity/index.nix

       ../common/golang/index.nix
       ../common/rust/index.nix
       ../common/typescript/index.nix
       ../common/docker/index.nix
    ];
}

