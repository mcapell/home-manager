# Troubleshooting

## Linux: first Home Manager switch

Determinate Nix may resolve `<nixpkgs>` to its weekly source instead of this
repository's channel. For the first Linux activation, run:

```bash
NIX_PATH="$HOME/.nix-defexpr/channels" home-manager switch
```

The Linux Home Manager configuration then manages the `nixpkgs` search path,
so `NIX_PATH` is not needed again.
