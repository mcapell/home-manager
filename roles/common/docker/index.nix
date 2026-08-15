{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    docker
    rootlesskit
    slirp4netns
    fuse-overlayfs
  ];

  # Rootless Docker listens on the per-user runtime socket instead of
  # the system daemon's /var/run/docker.sock.
  home.sessionVariables.DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";

  # Set this directly for Fish as well, since terminal emulators can inherit
  # Home Manager's session-variable guard from an older graphical session.
  programs.fish.shellInit = ''
    set -gx DOCKER_HOST "unix://$XDG_RUNTIME_DIR/docker.sock"
  '';

  systemd.user.services.docker = {
    Unit = {
      Description = "Docker Engine (rootless)";
      After = [ "network.target" ];
    };

    Service = {
      Environment = [
        "PATH=${lib.makeBinPath [ pkgs.rootlesskit pkgs.slirp4netns pkgs.fuse-overlayfs pkgs.iptables pkgs.iproute2 pkgs.util-linux ]}:/usr/bin:/bin"
        # Docker 27 does not recognize newer slirp4netns help output.
        "DOCKERD_ROOTLESS_ROOTLESSKIT_NET=slirp4netns"
        "DOCKERD_ROOTLESS_ROOTLESSKIT_MTU=65520"
      ];
      ExecStart = "${pkgs.docker}/bin/dockerd-rootless";
      Restart = "on-failure";
      RestartSec = "2s";
    };

    Install.WantedBy = [ "default.target" ];
  };
}
