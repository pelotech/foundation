# Changelog

## [1.2.0](https://github.com/pelotech/foundation/compare/v1.1.7...v1.2.0) (2025-03-29)


### Features

* bump KubeVirt to 1.5.0 ([#161](https://github.com/pelotech/foundation/issues/161)) ([a59d52e](https://github.com/pelotech/foundation/commit/a59d52e1baf7623f47aa0c3638b88223761a4b57))

## [1.1.7](https://github.com/pelotech/foundation/compare/v1.1.6...v1.1.7) (2025-03-25)


### Bug Fixes

* set data to empty instead of null to add additional values ([bcd0ec2](https://github.com/pelotech/foundation/commit/bcd0ec2108c850e8152898831bb30a7971db2ab8))

## [1.1.6](https://github.com/pelotech/foundation/compare/v1.1.5...v1.1.6) (2025-03-25)


### Bug Fixes

* upgrade nginx 1.10 -&gt; 1.12.1, upgrade alb controller chart 1.7.1 -&gt; 1.12.0 ([84ebbea](https://github.com/pelotech/foundation/commit/84ebbea5c5120f64c1e9c2a737594f3086f478bc))

## [1.1.5](https://github.com/pelotech/foundation/compare/v1.1.4...v1.1.5) (2025-03-18)


### Miscellaneous Chores

* release 1.1.5 ([7bb5322](https://github.com/pelotech/foundation/commit/7bb532231754b05a27d1019736caa461ac87ee17))

## [1.1.4](https://github.com/pelotech/foundation/compare/v1.1.3...v1.1.4) (2025-03-13)


### Bug Fixes

* upgrade to latest argocd version ([cfed770](https://github.com/pelotech/foundation/commit/cfed770aad6f60910406d1936617624fba91f145))

## [1.1.3](https://github.com/pelotech/foundation/compare/v1.1.2...v1.1.3) (2025-03-10)


### Bug Fixes

* disable gpg sops for helm secrets ([0903d29](https://github.com/pelotech/foundation/commit/0903d2940f0edc68a06d6adcc52017800a38c2c1))

## [1.1.2](https://github.com/pelotech/foundation/compare/v1.1.1...v1.1.2) (2025-03-10)


### Bug Fixes

* revert ksops container version back till merged with helm-secrets ([b92072b](https://github.com/pelotech/foundation/commit/b92072bd642d5ff58aa797c42d91d69518819879))

## [1.1.1](https://github.com/pelotech/foundation/compare/v1.1.0...v1.1.1) (2025-03-09)


### Bug Fixes

* order matters for init containers ([#151](https://github.com/pelotech/foundation/issues/151)) ([9bb32b6](https://github.com/pelotech/foundation/commit/9bb32b62dee837c4c7f764b8d83dbfd14bfd172f))

## [1.1.0](https://github.com/pelotech/foundation/compare/v1.0.3...v1.1.0) (2025-03-09)


### Features

* enable helm-secrets for argocd ([#149](https://github.com/pelotech/foundation/issues/149)) ([a870f55](https://github.com/pelotech/foundation/commit/a870f5598fd4529170e1df532210cd3d0fbc502e))

## [1.0.3](https://github.com/pelotech/foundation/compare/v1.0.2...v1.0.3) (2025-03-08)


### Bug Fixes

* utils needs destination for kube-system for karpenter-dns ([8481799](https://github.com/pelotech/foundation/commit/8481799370f64b7f515a54839f6d5844bbb939bf))

## [1.0.2](https://github.com/pelotech/foundation/compare/v1.0.1...v1.0.2) (2025-03-08)


### Bug Fixes

* remove unused appproject and update readme with missing source/destinations ([cdccfc7](https://github.com/pelotech/foundation/commit/cdccfc74560e0551f0a63c1208aa9fdb3b18356d))

## [1.0.1](https://github.com/pelotech/foundation/compare/v1.0.0...v1.0.1) (2025-03-07)


### Bug Fixes

* add missing source for storage app project ([bea481d](https://github.com/pelotech/foundation/commit/bea481dda1f66b20423d53bd8011aa93726ae74a))

## [1.0.0](https://github.com/pelotech/foundation/compare/v0.3.2...v1.0.0) (2025-03-07)


### ⚠ BREAKING CHANGES

* separate out the various app project by category ([#144](https://github.com/pelotech/foundation/issues/144))

### Features

* separate out the various app project by category ([#144](https://github.com/pelotech/foundation/issues/144)) ([d1362eb](https://github.com/pelotech/foundation/commit/d1362eb9de6812f2adb513132cf0dfe8286ccb47))

## [0.3.2](https://github.com/pelotech/foundation/compare/v0.3.1...v0.3.2) (2025-02-25)


### Bug Fixes

* kubevirt virt-api scheduling ([#142](https://github.com/pelotech/foundation/issues/142)) ([447853f](https://github.com/pelotech/foundation/commit/447853fac1135ff7539e6b7ec3507a6695e84421))

## [0.3.1](https://github.com/pelotech/foundation/compare/v0.3.0...v0.3.1) (2025-02-19)


### Bug Fixes

* nidhogg node placement ([#140](https://github.com/pelotech/foundation/issues/140)) ([fe20c4d](https://github.com/pelotech/foundation/commit/fe20c4d3abfe2a9e4d2dc26d964dcaffe1dfc4d7))

## [0.3.0](https://github.com/pelotech/foundation/compare/v0.2.0...v0.3.0) (2025-02-17)


### Features

* nidhogg release 0.6.5 ([#137](https://github.com/pelotech/foundation/issues/137)) ([61e378a](https://github.com/pelotech/foundation/commit/61e378a5a230b04d444c3ad3ac6ec3549645df33))

## [0.2.0](https://github.com/pelotech/foundation/compare/v0.1.0...v0.2.0) (2025-02-14)


### Features

* bump ArgoCD to v2.14.2 ([#135](https://github.com/pelotech/foundation/issues/135)) ([e72cd35](https://github.com/pelotech/foundation/commit/e72cd35c1cd87af100b258a599c265b6c1151dd2))

## [0.1.0](https://github.com/pelotech/foundation/compare/v0.0.131...v0.1.0) (2025-02-11)


### Features

* update to use release-please ([#132](https://github.com/pelotech/foundation/issues/132)) ([24658b7](https://github.com/pelotech/foundation/commit/24658b77a877f28a680269cd76b790692912ad8a))
