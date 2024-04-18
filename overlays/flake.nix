{
  description = "A flake that applies fixes to packages we need for the project";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      overlay = (final: prev: {
        # kustomize-sops in nixpkgs uses the old location and install format
        # this fixes the install path until the pkg gets updated properly
        # https://github.com/NixOS/nixpkgs/issues/175515
        kustomize-sops = prev.kustomize-sops.overrideAttrs {
          installPhase = ''
            install -Dm644 "$GOPATH/bin/kustomize-sops" "$out/bin/ksops"
          '';
        };
      });

      pkgs =
        import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };

    in rec {
      packages = {
        kustomize-sops = pkgs.kustomize-sops;
      };
    }
  );
}
