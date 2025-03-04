{ config, pkgs, ... }:

{
    home.username = "marc";
    home.homeDirectory = "/home/marc";

    home.packages = with pkgs; [
        libglvnd
        mesa

        nicotine-plus # music download
    ];

    imports = [
       ../common/tools/index.nix
       ../common/terminal/index.nix
       ../common/editor/index.nix
       ../common/golang/index.nix
    ];
}

