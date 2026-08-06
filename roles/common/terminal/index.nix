{ pkgs, ... }:

let
  fish = pkgs.unstable.fish;
in
{
  home.packages = with pkgs; [
    fish
    zellij
    pkgs.unstable.nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.fish = {
    enable = true;
    package = fish;
    # fish >=4.0 (Rust rewrite) dropped share/fish/tools/create_manpage_completions.py,
    # which home-manager's fish module still relies on for this feature.
    generateCompletions = false;
    shellInit = import ./fish/config.fish.nix {
      inherit pkgs fish;
    };
  };

  home.file.".config/fish/functions" = {
    source = ./fish/functions;
    recursive = true;
  };

  home.file.".config/zellij/config.kdl".source = pkgs.substituteAll {
    src = ./zellij/config.kdl.in;
    fish = "${fish}/bin/fish";
  };

  home.file.".config/ghostty/config".text = ''
    font-family = "JetBrainsMono Nerd Font"
    font-size = 14
    command = "${fish}/bin/fish"
  '';
}
