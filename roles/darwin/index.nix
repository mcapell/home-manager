{ config, pkgs, ... }:

{
    imports = [
       ../common/terminal/index.nix 
       ../common/editor/index.nix 
    ];
}
