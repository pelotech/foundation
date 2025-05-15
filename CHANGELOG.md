# Changelog

## [2.3.4](https://github.com/pelotech/foundation/compare/v2.3.3...v2.3.4) (2025-05-15)


### Bug Fixes

* **deps:** update helm release crossplane to v1.19.1 ([#181](https://github.com/pelotech/foundation/issues/181)) ([ec01dca](https://github.com/pelotech/foundation/commit/ec01dcab1ac3b3717ac2482a3db4e53ce9b55eb4))

## [2.3.3](https://github.com/pelotech/foundation/compare/v2.3.2...v2.3.3) (2025-05-14)


### Bug Fixes

* **deps:** update helm release aws-ebs-csi-driver to v2.43.0 ([#176](https://github.com/pelotech/foundation/issues/176)) ([7df9396](https://github.com/pelotech/foundation/commit/7df9396943a2b182729ebeb355d83ca9d0116a6a))
* **deps:** update helm release aws-load-balancer-controller to v1.13.0 ([#178](https://github.com/pelotech/foundation/issues/178)) ([6629126](https://github.com/pelotech/foundation/commit/66291261a2bf7a34cb45dd0608b74bc30e07fcda))
* **deps:** update helm release k8s-monitoring to v2.0.29 ([#175](https://github.com/pelotech/foundation/issues/175)) ([324a7cd](https://github.com/pelotech/foundation/commit/324a7cd88e1bd48aabef4fbcba3692415f52f6fd))
* **deps:** update helm release k8s-monitoring to v2.0.30 ([#197](https://github.com/pelotech/foundation/issues/197)) ([245bd32](https://github.com/pelotech/foundation/commit/245bd327d9c30477dafdfd8c9f00bb5e2f4f6fab))

## [2.3.2](https://github.com/pelotech/foundation/compare/v2.3.1...v2.3.2) (2025-05-13)


### Bug Fixes

* update to get correct port as number as well as annotation value as string instead of bool ([fd8f14d](https://github.com/pelotech/foundation/commit/fd8f14d38ad4b6f41812f93e089f53044d84d88c))

## [2.3.1](https://github.com/pelotech/foundation/compare/v2.3.0...v2.3.1) (2025-05-13)


### Bug Fixes

* **deps:** update helm release aws-mountpoint-s3-csi-driver to v1.14.1 ([#179](https://github.com/pelotech/foundation/issues/179)) ([ab7a400](https://github.com/pelotech/foundation/commit/ab7a400810b5ee9bde1ba5f8a71bf585587427ec))
* **deps:** update helm release cert-manager to v1.17.2 ([#180](https://github.com/pelotech/foundation/issues/180)) ([05ac978](https://github.com/pelotech/foundation/commit/05ac9786a90e9aa172b9214992f865676af79ad0))
* **deps:** update helm release external-dns to v8 ([#189](https://github.com/pelotech/foundation/issues/189)) ([e90d604](https://github.com/pelotech/foundation/commit/e90d60484c3bf758d9182a96862b54d614db1112))
* **deps:** update helm release fluent-bit to v0.49.0 ([#183](https://github.com/pelotech/foundation/issues/183)) ([6bab4c6](https://github.com/pelotech/foundation/commit/6bab4c6c2ccd060f70944c327bcc5793db34890a))
* **deps:** update helm release goldilocks to v9 ([#190](https://github.com/pelotech/foundation/issues/190)) ([ec64ccf](https://github.com/pelotech/foundation/commit/ec64ccfe4d915a71613ad75e5120e6bdc183a75f))
* **deps:** update helm release loki to v5.48.0 ([#185](https://github.com/pelotech/foundation/issues/185)) ([5128c94](https://github.com/pelotech/foundation/commit/5128c94c0531d99be4b28c3fd922f67e96830b78))
* **deps:** update helm release loki to v6 ([#191](https://github.com/pelotech/foundation/issues/191)) ([2444506](https://github.com/pelotech/foundation/commit/24445063a8fff25102f4ff575cd3e704170cbb3d))
* **deps:** update helm release reloader to v2 ([#192](https://github.com/pelotech/foundation/issues/192)) ([68877a6](https://github.com/pelotech/foundation/commit/68877a66cf621c8f6df6445e56a3666a1b59144c))

## [2.3.0](https://github.com/pelotech/foundation/compare/v2.2.0...v2.3.0) (2025-05-13)


### Features

* upgrade to argocd 3.0 and latest image updater chart ([b6d79f7](https://github.com/pelotech/foundation/commit/b6d79f7220be7ef85bb181269a84a93e313eee51))

## [2.2.0](https://github.com/pelotech/foundation/compare/v2.1.1...v2.2.0) (2025-04-03)


### Features

* **components:** grafana-k8s-monitoring app ([#172](https://github.com/pelotech/foundation/issues/172)) ([73ce693](https://github.com/pelotech/foundation/commit/73ce69363c7d6b704557363649130654877fd939))

## [2.1.1](https://github.com/pelotech/foundation/compare/v2.1.0...v2.1.1) (2025-03-30)


### Bug Fixes

* **deps:** update dependency kubevirt/common-instancetypes to v0.4.1 ([#168](https://github.com/pelotech/foundation/issues/168)) ([7e79745](https://github.com/pelotech/foundation/commit/7e797453c3927c60fff0bcb47e23fc13238ec1f1))
* **deps:** update dependency kubevirt/common-instancetypes to v1.3.1 ([#126](https://github.com/pelotech/foundation/issues/126)) ([a2aeb0b](https://github.com/pelotech/foundation/commit/a2aeb0b29396cf1ab5670c4ff6a7140092e6f2bc))

## [2.1.0](https://github.com/pelotech/foundation/compare/v2.0.1...v2.1.0) (2025-03-30)


### Features

* bump Karpenter to v1.3.3x ([#162](https://github.com/pelotech/foundation/issues/162)) ([eaa3ddb](https://github.com/pelotech/foundation/commit/eaa3ddbfe654cf992488c22fc83b7d87cf908601))

## [2.0.1](https://github.com/pelotech/foundation/compare/v2.0.0...v2.0.1) (2025-03-29)


### Bug Fixes

* remove nidhogg time delay ([#166](https://github.com/pelotech/foundation/issues/166)) ([2351e69](https://github.com/pelotech/foundation/commit/2351e693b5a35ecf111461211a9be8c9557d81d9))

## [2.0.0](https://github.com/pelotech/foundation/compare/v1.2.0...v2.0.0) (2025-03-29)


### ⚠ BREAKING CHANGES

* move external-dns to components ([#164](https://github.com/pelotech/foundation/issues/164))

### Features

* move external-dns to components ([#164](https://github.com/pelotech/foundation/issues/164)) ([c78694c](https://github.com/pelotech/foundation/commit/c78694c754863751a24a51bb7dfa81f7d7fc93fd))

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
