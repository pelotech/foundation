FROM mcr.microsoft.com/devcontainers/base:bullseye
#install ksops
RUN curl -s https://raw.githubusercontent.com/viaduct-ai/kustomize-sops/master/scripts/install-ksops-archive.sh | bash
#install kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash -s 5.0.0
RUN mv ./kustomize /usr/local/bin/
#install kfilt
RUN wget "https://github.com/ryane/kfilt/releases/download/v0.0.7/kfilt_0.0.7_linux_amd64"
RUN mv ./kfilt_0.0.7_linux_amd64 /usr/local/bin/kfilt && sudo chmod +x /usr/local/bin/kfilt
