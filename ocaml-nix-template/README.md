# OCaml Nix Template

This is a template for an OCaml project using Nix and direnv.

## Setup

- Install nix
- Enable https://nixos.wiki/wiki/Flakes
- Install direnv `nix-env -i direnv`

Then run

```shell
cd ocaml-nix-template
direnv allow
dune exec do-that # check
```

## VSCode

Open the project, install all the recommend extensions, allow direnv and reload window.

## Dependencies

If you want to find out dependencies you can use the REPL.

```shell
nix repl
:lf . # load flake
builtins.attrNames inputs.nixpkgs.legacyPackages.x86_64-linux.ocamlPackages
```

Also this template uses this repository `https://github.com/nix-ocaml/nix-overlays`.

To **install dependencies**, pen `flake.nix` and change the `propagatedBuildInputs` of the package.
