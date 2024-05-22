{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim

    stylua
  ];

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
