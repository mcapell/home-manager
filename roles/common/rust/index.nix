{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # rustup provides the cargo and rustc proxies.
    pkgs.unstable.rustup
  ];
}
