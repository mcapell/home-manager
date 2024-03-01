{ config, pkgs, ... }:

{
    imports = [
       ../common/terminal/index.nix 
       ../common/editor/index.nix 
       ../common/tools/index.nix 
       ../common/writing/index.nix 

       ../common/golang/index.nix 
       ../common/typescript/index.nix 
    ];
}
