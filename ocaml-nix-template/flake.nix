{
  description = "Nix Flake";

  inputs = {
    nixpkgs.url = "github:anmonteiro/nix-overlays";
    nix-filter.url = "github:numtide/nix-filter";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nix-filter, flake-utils }:
    # packages being built by this flake
    let makeExportedPackages = { pkgs }:
      with pkgs; with ocamlPackages;
      let ocaml-nix-template =
        buildDunePackage {
          pname = "ocaml-nix-template";
          version = "n/a";
          src = ./.;
          propagatedBuildInputs = [ ppxlib ];
          checkInputs = [ alcotest ];
          doCheck = true;
        }; in
      { inherit ocaml-nix-template; }; in
    # setup your development environment
    let makeDevShell = { pkgs, exportedPackages }:
      with pkgs; with ocamlPackages;
      mkShell {
        inputsFrom = builtins.attrValues exportedPackages;
        packages = [
          # Make developer life easier
          # Nix tooling
          nixfmt

          # OCaml tooling
          ocaml
          ocamlformat
          dune_3
          ocaml-lsp
        ];
      }; in
    # setup
    let overlays = (self: super:
      with super; {
        ocaml-ng = ocaml-ng // (with ocaml-ng; {
          ocamlPackages_5_1 = ocamlPackages_5_1.overrideScope'
            (_: super: {
              ocaml-lsp = super.ocaml-lsp.overrideAttrs (_: {
                src = fetchFromGitHub {
                  owner = "ocaml";
                  repo = "ocaml-lsp";
                  rev = "cb06208ce9f2bf7c9714e2a1c74eb5d2c93bdf51";
                  sha256 = "Tx5nDCHc+7aGJ6HVXLfa6tx44862yS8dlKHNmFU2lrc=";
                  fetchSubmodules = true;
                };
              });
              jsonrpc = super.jsonrpc.overrideAttrs (_: {
                src = fetchFromGitHub {
                  owner = "ocaml";
                  repo = "ocaml-lsp";
                  rev = "cb06208ce9f2bf7c9714e2a1c74eb5d2c93bdf51";
                  sha256 = "Tx5nDCHc+7aGJ6HVXLfa6tx44862yS8dlKHNmFU2lrc=";
                  fetchSubmodules = true;
                };
              });
            });
        });
      }
    ); in
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = (nixpkgs.makePkgs {
        inherit system; extraOverlays = [ overlays ];
      }).extend (self: super: {
        ocamlPackages = super.ocaml-ng.ocamlPackages_5_1;
      }); in

      let exportedPackages = makeExportedPackages { inherit pkgs; }; in
      {
        packages = exportedPackages;
        devShell = makeDevShell { inherit pkgs; inherit exportedPackages; };
      });
}
