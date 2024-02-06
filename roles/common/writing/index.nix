{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Plaintext
    pandoc

    # bibtex, pdflatex, etc.
    texliveMedium 
  ];
}

