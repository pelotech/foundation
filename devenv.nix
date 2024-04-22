{ pkgs, ...}:

{
  languages.terraform = {
    enable = true;
    version = "1.5.7";
  };

  packages = [
    # PreCommit hook tooling
    pkgs.pre-commit
    pkgs.hcledit
    pkgs.tflint
    pkgs.terraform-docs
    pkgs.kubernetes-helm
    # Kubernetes tooling required to use repo effectively
    pkgs.kubectl
    pkgs.kustomize
    pkgs.kustomize-sops
    pkgs.crossplane-cli
  ];

  devcontainer.enable = true;
}
