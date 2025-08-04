{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.neovim

    stylua
  ];

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
