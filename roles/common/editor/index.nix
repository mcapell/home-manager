{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.neovim

    stylua
    tree-sitter  # required for neovim
  ];

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
