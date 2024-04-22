# TOOLS

## Description

This is a list of all required tools and optional suggested tools.

### Tools

This project manages all of it's development dependencies with [devenv](https://devenv.sh). Follow the [Getting Started Guide](https://devenv.sh/getting-started/) to install devenv (and nix) and then run

```
devenv shell
```
To bring up a shell with all necessary project dependencies.


#### Required

* **terraform**: (provision base kubernetes cluster and roles)
* **kubernetes (EKS)**: The core component of the system, EKS provides a managed Kubernetes control plane to run containerized applications.
* **helm**: A package manager for Kubernetes
* **kustomize**: A tool for customizing Kubernetes configurations.
* **sops**: Secrets OPerationS and is a CLI tool used for the encryption, and decryption of files in YAML, JSON, BINARY, ENV, and INI formats using various backends, including PGP, age, AWS KMS, GCP KMS, Azure Key Vault and HashiCorp Vault. That makes it cloud-agnostic. Works on Windows, Linux, and macOS
  * **age**: Prefered way to use sops - `age-keygen -o ~/.config/sops/age/keys.txt`($XDG_CONFIG_HOME/sops/age/keys.txt) and add the public key to the .sops.yaml file, and make sure to save and keep private the keys.txt file
* **ksops (Kustomize with sops)**: is a kustomize KRM exec plugin for SOPS encrypted resources. KSOPS can be used to decrypt any Kubernetes resource, but is most commonly used to decrypt encrypted Kubernetes Secrets and ConfigMaps

#### Suggested

1. **Pre-commit**: Pre-commit is a tool that allows you to set up and enforce code quality checks before each commit. It helps catch issues early on and ensures that only clean and well-formatted code is committed. To use pre-commit, you need to define a configuration file (`.pre-commit-config.yaml`) in your project, specifying the hooks or checks you want to run before committing.

1. **Git commit message linting (with pre-commit)**: Git commit message linting is a practice of enforcing specific rules or guidelines for writing commit messages. By using a commit message linter, you can ensure that commit messages follow a consistent format, contain relevant information, and provide meaningful context about the changes made. Tools like Commitlint or Husky can be used to enforce commit message standards in your Git workflow.

1. **Linting (with pre-commit)**: Linting is the process of analyzing your code for potential errors, bugs, or stylistic issues. By using a linter, you can automatically identify and fix common coding mistakes, enforce coding conventions, and improve code readability.
    * tflint - linting for terraform
    * yamlint - linting for yaml
    * helm-lint - linting for helm charts

1. **Renovate**: Renovate is a tool that helps automate dependency management in your projects. It regularly scans your codebase for outdated dependencies and automatically creates pull requests to update them. This ensures that your project stays up-to-date with the latest security patches and feature improvements.

1. **Backstage**: Backstage is an open-source platform developed by Spotify for managing software development projects. It provides a unified interface for developers, making it easier to visualize and understand the various components of your project. Backstage can be used to document APIs, services, and infrastructure, making it a valuable tool for improving code quality through better project management and collaboration.

1. **mkdocs (with backstage)**: MkDocs is a fast, simple, and straightforward static site generator for creating documentation websites.

1. **Devcontainers**: Devcontainers enable developers to define and share consistent development environments using Docker containers. By using devcontainers, you can ensure that everyone on your team has the same development setup, reducing environment-related issues and improving code quality.

1. **Github Actions (with devcontainer)**: Using devcontainers as the build primitive you can move the build from CI system to CI system with little effort. All the dependencies are defined in a portable way.

1. **MkDocs**: MkDocs is a static site generator that allows you to create beautiful documentation sites for your projects. It uses Markdown files as the source content and generates HTML-based documentation with a clean and user-friendly interface. MkDocs simplifies the process of documenting your codebase, making it easier for developers to understand and contribute to your project.

1. **[aws-sso](https://github.com/synfinatic/aws-sso-cli)**: simplify aws config cli tool management across organizations

1. **[kube-switch](https://github.com/danielfoehrKn/kubeswitch)**: is the single pane of glass for all of your kubeconfig files. incl. things like auto discovery of clusters in aws accounts
