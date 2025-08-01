# Changelog

## [2.7.4](https://github.com/pelotech/foundation/compare/v2.7.3...v2.7.4) (2025-07-31)


### Bug Fixes

* bump KubeVirt to 1.6 ([#267](https://github.com/pelotech/foundation/issues/267)) ([84a9b67](https://github.com/pelotech/foundation/commit/84a9b6734d094ab5634e477e103d06a2ac5c3859))

## [2.7.3](https://github.com/pelotech/foundation/compare/v2.7.2...v2.7.3) (2025-07-31)


### Bug Fixes

* **multus:** revert to v3.9.x ([#264](https://github.com/pelotech/foundation/issues/264)) ([39f1dbd](https://github.com/pelotech/foundation/commit/39f1dbd88593897ad342165d27741c8589f2790c))
* revert Karpenter to v1.3.3x until NodeOverlay ([#263](https://github.com/pelotech/foundation/issues/263)) ([1569cf2](https://github.com/pelotech/foundation/commit/1569cf208b70a5af9fff8accae953ad74d9e0725))

## [2.7.2](https://github.com/pelotech/foundation/compare/v2.7.1...v2.7.2) (2025-07-29)


### Bug Fixes

* consolidate multus daemonset overlays ([#258](https://github.com/pelotech/foundation/issues/258)) ([ab4efa3](https://github.com/pelotech/foundation/commit/ab4efa3ed684ca8697746c3434f9d348dfe1eec4))
* **kubevirt/cdi:** bump versions ([#260](https://github.com/pelotech/foundation/issues/260)) ([324933a](https://github.com/pelotech/foundation/commit/324933a1785cad78509d1f096c218094860f571f))

## [2.7.1](https://github.com/pelotech/foundation/compare/v2.7.0...v2.7.1) (2025-07-29)


### Bug Fixes

* multus should have critical priority class ([323b501](https://github.com/pelotech/foundation/commit/323b50109e2616d3eeda6174f28c6c1fddcd6130))

## [2.7.0](https://github.com/pelotech/foundation/compare/v2.6.10...v2.7.0) (2025-07-28)


### Features

* **multus:** bump version to 4.2.2 ([#255](https://github.com/pelotech/foundation/issues/255)) ([e120f1c](https://github.com/pelotech/foundation/commit/e120f1c75cb1d1417f01147007ad9d0ca759ef07))

## [2.6.10](https://github.com/pelotech/foundation/compare/v2.6.9...v2.6.10) (2025-07-28)


### Bug Fixes

* **deps:** update helm release aws-ebs-csi-driver to v2.46.0 ([#251](https://github.com/pelotech/foundation/issues/251)) ([15d6362](https://github.com/pelotech/foundation/commit/15d6362ff6e05d3ed9758c8dcbbae9972afa9fa8))
* **deps:** update helm release external-dns to v9 ([#252](https://github.com/pelotech/foundation/issues/252)) ([78c2ce5](https://github.com/pelotech/foundation/commit/78c2ce50a8051b195ecc01f5803f6596364a85b2))
* enable prometheusOperatorObjects by default and remove unused components ([#253](https://github.com/pelotech/foundation/issues/253)) ([52d1432](https://github.com/pelotech/foundation/commit/52d1432fb2a4eebb9e0be1fea6ed1633745adbb3))
* update argocd ingress secret to updated name, fix nginx controller for cert-manager ([54d777e](https://github.com/pelotech/foundation/commit/54d777e7062b6c724a9568f7697b3d1f779b7ccf))
* upgrade argocd to latest version ([c99b907](https://github.com/pelotech/foundation/commit/c99b907bf4e2a3f4fd51a9e9ee317cd0f1fb9562))

## [2.6.9](https://github.com/pelotech/foundation/compare/v2.6.8...v2.6.9) (2025-07-11)


### Bug Fixes

* **deps:** update dependency pelotech/nidhogg to v0.7.0 ([#221](https://github.com/pelotech/foundation/issues/221)) ([b10c958](https://github.com/pelotech/foundation/commit/b10c9588e19ac67db66ab82c592dc37fe67c2b19))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v1.15.0 ([#245](https://github.com/pelotech/foundation/issues/245)) ([3f8a0e0](https://github.com/pelotech/foundation/commit/3f8a0e0bb17070260d23d0871a8e20e257f8738d))
* **deps:** update helm release crossplane to v1.20.0 ([#207](https://github.com/pelotech/foundation/issues/207)) ([c1fcdeb](https://github.com/pelotech/foundation/commit/c1fcdeb5f1ef5e38e7a9c41a5dc44cce7c9e707f))
* **deps:** update helm release fluent-bit to v0.50.0 ([#246](https://github.com/pelotech/foundation/issues/246)) ([c88c491](https://github.com/pelotech/foundation/commit/c88c49157e0820941027ec0b4076435dc5f626e5))
* **deps:** update helm release k8s-monitoring to v3 ([#226](https://github.com/pelotech/foundation/issues/226)) ([992c063](https://github.com/pelotech/foundation/commit/992c063fe11091036af103d305cd2242a11e8d6c))
* **deps:** update helm release loki to v6.31.0 ([#248](https://github.com/pelotech/foundation/issues/248)) ([bb29677](https://github.com/pelotech/foundation/commit/bb29677b0e1cdc0a2a6bf7baa5a5fe036ebbd31c))

## [2.6.8](https://github.com/pelotech/foundation/compare/v2.6.7...v2.6.8) (2025-07-09)


### Bug Fixes

* **deps:** update dependency kubernetes-csi/external-snapshotter to v8.3.0 ([#244](https://github.com/pelotech/foundation/issues/244)) ([681f34a](https://github.com/pelotech/foundation/commit/681f34a2b3ae2898e358fc2fad2875b190739d7a))
* **deps:** update helm release aws-ebs-csi-driver to v2.45.1 ([#208](https://github.com/pelotech/foundation/issues/208)) ([3698d73](https://github.com/pelotech/foundation/commit/3698d734eed8fe0ea199fca9b715d12bb2ff1516))
* **deps:** update helm release aws-load-balancer-controller to v1.13.3 ([#239](https://github.com/pelotech/foundation/issues/239)) ([9ba07e6](https://github.com/pelotech/foundation/commit/9ba07e6617306151c8a98914cf0b01e1a25c1962))
* **deps:** update helm release cert-manager to v1.18.2 ([#223](https://github.com/pelotech/foundation/issues/223)) ([59277af](https://github.com/pelotech/foundation/commit/59277afaab40920e9f6f75bff4d50d130cf23d24))
* **deps:** update helm release external-dns to v8.9.2 ([#217](https://github.com/pelotech/foundation/issues/217)) ([d4ece90](https://github.com/pelotech/foundation/commit/d4ece9030b84837768198cb306860c17c83a023e))
* **deps:** update helm release reloader to v2.1.5 ([#243](https://github.com/pelotech/foundation/issues/243)) ([236bdb1](https://github.com/pelotech/foundation/commit/236bdb1521ac7cb83c15d357434934cdc7f7eb99))

## [2.6.7](https://github.com/pelotech/foundation/compare/v2.6.6...v2.6.7) (2025-07-09)


### Bug Fixes

* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v0.12.3 ([#237](https://github.com/pelotech/foundation/issues/237)) ([f55b4a6](https://github.com/pelotech/foundation/commit/f55b4a6b34ab207fcadbaac798c24369d6f429ba))
* **kyverno:** update to latest helm chart and bind metrics port to not 8080 ([#235](https://github.com/pelotech/foundation/issues/235)) ([3da6de4](https://github.com/pelotech/foundation/commit/3da6de4da044626aa1b5de35bdd9f6007e16a2ff))

## [2.6.6](https://github.com/pelotech/foundation/compare/v2.6.5...v2.6.6) (2025-07-09)


### Bug Fixes

* remove uneeded target ports ([f694384](https://github.com/pelotech/foundation/commit/f6943849294d4459d84691b575c2f1e969d671d1))

## [2.6.5](https://github.com/pelotech/foundation/compare/v2.6.4...v2.6.5) (2025-07-09)


### Bug Fixes

* update missed chart version and name with change to upstream ([3575495](https://github.com/pelotech/foundation/commit/35754950ab4cc2e92d1e1d73bce40534e3fc0035))

## [2.6.4](https://github.com/pelotech/foundation/compare/v2.6.3...v2.6.4) (2025-07-09)


### Bug Fixes

* update replacement for upstream nginx which has controller object ([4052ccf](https://github.com/pelotech/foundation/commit/4052ccf3507fd8eb4f9f74df6a4dd575a725a663))

## [2.6.3](https://github.com/pelotech/foundation/compare/v2.6.2...v2.6.3) (2025-07-09)


### Bug Fixes

* use upstream ingress nginx instead of bitnami's ([be383e7](https://github.com/pelotech/foundation/commit/be383e7e7904b3e1854f4a25da277cf8a87b7782))

## [2.6.2](https://github.com/pelotech/foundation/compare/v2.6.1...v2.6.2) (2025-07-09)


### Bug Fixes

* use port 80/443 and publish service enabled ([af75ffe](https://github.com/pelotech/foundation/commit/af75ffe14a8648a91c62934c59ba7dde35007161))

## [2.6.1](https://github.com/pelotech/foundation/compare/v2.6.0...v2.6.1) (2025-07-09)


### Bug Fixes

* oci registry fix and enable-ssl-passthrough fix ([8bdd476](https://github.com/pelotech/foundation/commit/8bdd476353d85e3258fb66525e71a246ed7f232b))

## [2.6.0](https://github.com/pelotech/foundation/compare/v2.5.0...v2.6.0) (2025-07-09)


### Features

* nginx in a separate argo app and helm vs kustomize ([#227](https://github.com/pelotech/foundation/issues/227)) ([c0e7f30](https://github.com/pelotech/foundation/commit/c0e7f30e98cfcf16a284fad67081a2126932413d))

## [2.5.0](https://github.com/pelotech/foundation/compare/v2.4.0...v2.5.0) (2025-07-08)


### Features

* **renovate:** Use terser (and more flexible) config syntax. ([#224](https://github.com/pelotech/foundation/issues/224)) ([ee55bb5](https://github.com/pelotech/foundation/commit/ee55bb5d34b05125057e1669e6de59280ef690de))


### Bug Fixes

* **deps:** update helm release fluent-bit to v0.49.1 ([#218](https://github.com/pelotech/foundation/issues/218)) ([e0e71b2](https://github.com/pelotech/foundation/commit/e0e71b2fa9affde37724075eb696e3f71f7f01e1))
* karpenter upgrade to 1.5.1 ([45b77b9](https://github.com/pelotech/foundation/commit/45b77b9ec87e72a303affd483b9320cf1f9e6efb))
* **renovate:** Avoid absolute path in `managerFilePatterns`. ([#225](https://github.com/pelotech/foundation/issues/225)) ([6d468b9](https://github.com/pelotech/foundation/commit/6d468b91894580d311c0759129269a2cc9cc8d57))

## [2.4.0](https://github.com/pelotech/foundation/compare/v2.3.7...v2.4.0) (2025-06-06)


### Features

* upgrade argocd to 3.0.5 ([#219](https://github.com/pelotech/foundation/issues/219)) ([8539d73](https://github.com/pelotech/foundation/commit/8539d73bf5616e70548701fb8d0ba14be3e7e4bb))

## [2.3.7](https://github.com/pelotech/foundation/compare/v2.3.6...v2.3.7) (2025-05-29)


### Bug Fixes

* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v0.12.2 ([#213](https://github.com/pelotech/foundation/issues/213)) ([09c76af](https://github.com/pelotech/foundation/commit/09c76affc5864664065c102f90d938293398fb6e))
* **deps:** update helm release external-dns to v8.8.3 ([#212](https://github.com/pelotech/foundation/issues/212)) ([d9ec831](https://github.com/pelotech/foundation/commit/d9ec83176ddd24ce840cae2e79ccd6fe5e5a6e2e))
* **deps:** update helm release k8s-monitoring to v2.1.4 ([#206](https://github.com/pelotech/foundation/issues/206)) ([156fba9](https://github.com/pelotech/foundation/commit/156fba9b1560d327480540ce365aec719ae5cf8b))
* **deps:** update helm release loki to v6.30.1 ([#209](https://github.com/pelotech/foundation/issues/209)) ([d250efc](https://github.com/pelotech/foundation/commit/d250efc7076639222c3a0f23779096b295105c0b))
* remove hostnetwork from nidhogg ([#215](https://github.com/pelotech/foundation/issues/215)) ([0e765a5](https://github.com/pelotech/foundation/commit/0e765a5e6aa48dbf4c98a7b016bbae7c44c83da4))

## [2.3.6](https://github.com/pelotech/foundation/compare/v2.3.5...v2.3.6) (2025-05-20)


### Bug Fixes

* **deps:** update helm release k8s-monitoring to v2.1.1 ([#204](https://github.com/pelotech/foundation/issues/204)) ([e4f0ebd](https://github.com/pelotech/foundation/commit/e4f0ebd2d749bc9f695aaf6af6fe33dd33cb0b06))

## [2.3.5](https://github.com/pelotech/foundation/compare/v2.3.4...v2.3.5) (2025-05-16)


### Bug Fixes

* **deps:** update helm release aws-load-balancer-controller to v1.13.1 ([#200](https://github.com/pelotech/foundation/issues/200)) ([2f006d4](https://github.com/pelotech/foundation/commit/2f006d4636ad36617e8da8e6cfe629c3e797b43a))
* **deps:** update helm release aws-load-balancer-controller to v1.13.2 ([#203](https://github.com/pelotech/foundation/issues/203)) ([fe7db24](https://github.com/pelotech/foundation/commit/fe7db246aa0582f0700d4be41f08ee3c1363f019))
* **deps:** update helm release k8s-monitoring to v2.1.0 ([#202](https://github.com/pelotech/foundation/issues/202)) ([3040a38](https://github.com/pelotech/foundation/commit/3040a38719afe5597b83f3687484d462775f3a08))
* **deps:** update helm release kyverno to v3.4.1 ([#184](https://github.com/pelotech/foundation/issues/184)) ([c62ffb0](https://github.com/pelotech/foundation/commit/c62ffb0b87321834a4f0497380076c6a20dae7e6))
* **deps:** update helm release snapscheduler to v3.5.0 ([#198](https://github.com/pelotech/foundation/issues/198)) ([3717e18](https://github.com/pelotech/foundation/commit/3717e18834fe96eb8cc0da92edbef80c61ab0524))

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
