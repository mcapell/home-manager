# Home manager managed by Nix

## How to use this repository

1. Install Nix:

   https://nixos.org/download

2. Install home manager:

   ```bash
   nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
   nix-channel --add https://nixos.org/channels/nixos-24.11 nixpkgs
   nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
   nix-channel --update
   nix-shell '<home-manager>' -A install
   ```

3. Download this repository, and run Home Manager:

   On Linux, the first activation also needs the channel search path:
   ```bash
   NIX_PATH="$HOME/.nix-defexpr/channels" home-manager switch
   ```

   On macOS, run:
   ```bash
   home-manager switch
   ```

   After the first Linux activation, Home Manager manages the Nix search path,
   so `NIX_PATH` is no longer needed. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
   for details.

## One-time configurations

There are some configurations that are device-specific and can't be checked on this repository.

### Local git configuration

Create a `~/.gitconfig.local` file, with the following content:

    ```gitconfig
    [user]
        name = Marc
        email = marc@example.com
        signingkey = <key id>
    ```
