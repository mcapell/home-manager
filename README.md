# Home manager managed by Nix

## How to use this repository

1. Install Nix:

   https://nixos.org/download

2. Install home manager:

   ```bash
   nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
   nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
   nix-channel --update
   nix-shell '<home-manager>' -A install
   ```

3. Download this repository, and run home manager:
   ```bash
   home-manager switch
   ```
