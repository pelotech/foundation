{
  outputs = { ... }: {
    overlays.default = self: super: {
      # kustomize-sops in nixpkgs uses the old location and install format
      # this fixes the install path until the pkg gets updated properly
      # https://github.com/NixOS/nixpkgs/issues/175515
      kustomize-sops = super.kustomize-sops.overrideAttrs {
        installPhase = ''
          install -Dm644 "$GOPATH/bin/kustomize-sops" "$out/bin/ksops"
        '';
      };
    };
  };
}
