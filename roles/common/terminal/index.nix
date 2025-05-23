{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.fish
    zellij
    pkgs.unstable.nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.fish = {
    enable = true;
    package = pkgs.unstable.fish;
    shellInit = import ./fish/config.fish.nix {
      inherit pkgs;
    };
  };

  home.file.".config/fish/functions" = {
    source = ./fish/functions;
    recursive = true;
  };

  home.file.".config/zellij/config.kdl".source = pkgs.substituteAll {
    src = ./zellij/config.kdl.in;
    fish = "${pkgs.fish}/bin/fish";
  };

  home.file.".config/ghostty/config".text = ''
    font-family = "JetBrainsMono Nerd Font"
    font-size = 14
    command = "${pkgs.fish}/bin/fish"
  '';
}
