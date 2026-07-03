# Updating software installed by home-manager

This repository uses **Nix channels**.

Packages come from `<nixpkgs>` and `<nixpkgs-unstable>` (the latter via the
`unstable` overlay defined in `home.nix`).

To see which channels you are currently on:

```bash
nix-channel --list
```

## How to update within the current pinned revisions

Use this for routine updates. It advances the channels to their newest
revisions (e.g. the latest `24.11` revision, and the latest `nixpkgs-unstable`)
without changing the major release.

```bash
# 1. Pull the newest revisions of the channels you are subscribed to
nix-channel --update

# 2. Rebuild and activate your environment against the updated channels
NIXPKGS_ALLOW_UNFREE=1 home-manager switch
```

Shorthand:

```bash
nix-channel --update && NIXPKGS_ALLOW_UNFREE=1 home-manager switch
```

## How to jump to a newer major release

Use this to move to a new release series (for example `24.11` → `25.05`). This
is a bigger change and can involve breaking changes, so review the
[home-manager release notes](https://nix-community.github.io/home-manager/release-notes.xhtml)
first.

```bash
# 1. Re-point the channels to the new release (example: 25.05)
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-25.05 nixpkgs
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable

# 2. Update the channels
nix-channel --update

# 3. Rebuild and activate
NIXPKGS_ALLOW_UNFREE=1 home-manager switch
```

After switching to a new major release, also update:

- `home.stateVersion` in `home.nix` — **read the comment above it first**, as
  this controls stateful defaults and should only be changed deliberately.
- The pinned versions listed in `README.md` (and the ones at the top of this
  file) so the documentation stays accurate.

## Rolling back

If an update causes problems, list and switch to a previous generation:

```bash
home-manager generations
/nix/store/<hash>-home-manager-generation/activate
```
