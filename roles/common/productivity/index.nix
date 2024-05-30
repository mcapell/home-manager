{ pkgs, services, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.obsidian
  ];

  services.syncthing = {
      enable = true;
  };
}
