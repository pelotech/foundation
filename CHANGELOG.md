# Changelog

## [4.0.3](https://github.com/pelotech/foundation/compare/v4.0.2...v4.0.3) (2026-02-21)


### Chores

* align multus memory to avoid node-level OOM ([#400](https://github.com/pelotech/foundation/issues/400)) ([8d619ae](https://github.com/pelotech/foundation/commit/8d619ae3191d738c07352b0074ab9967e7aa93b6))
* **deps:** update actions/checkout digest to de0fac2 ([#391](https://github.com/pelotech/foundation/issues/391)) ([79a36e6](https://github.com/pelotech/foundation/commit/79a36e671f1397d584af1817e2af0f42347498f4))
* **deps:** update dependency kubernetes-csi/external-snapshotter to v8.5.0 ([#402](https://github.com/pelotech/foundation/issues/402)) ([ebf2539](https://github.com/pelotech/foundation/commit/ebf2539d21b592cdc073cfe426eaf46f7e553237))
* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v1.1.1 ([#386](https://github.com/pelotech/foundation/issues/386)) ([6f7c60b](https://github.com/pelotech/foundation/commit/6f7c60b44f505093b004052058690b0e22817860))
* **deps:** update ghcr.io/k8snetworkplumbingwg/multus-cni docker tag to v4.2.4 ([#398](https://github.com/pelotech/foundation/issues/398)) ([cc85c1c](https://github.com/pelotech/foundation/commit/cc85c1cc7c58d4ca4a2cd5f97d161363e43af4b9))
* **deps:** update helm release aws-ebs-csi-driver to v2.55.1 ([#399](https://github.com/pelotech/foundation/issues/399)) ([e64e9c0](https://github.com/pelotech/foundation/commit/e64e9c083421095b3d560a3f5bb987f31b2b785d))
* **deps:** update helm release cert-manager to v1.19.3 ([#389](https://github.com/pelotech/foundation/issues/389)) ([a5486d7](https://github.com/pelotech/foundation/commit/a5486d72229cd992008c6ab435a3ab765eb8089f))
* **deps:** update helm release ingress-nginx to v4.14.3 ([#390](https://github.com/pelotech/foundation/issues/390)) ([709d305](https://github.com/pelotech/foundation/commit/709d305a68524c6c1b7543d9516610704bee0d86))
* **deps:** update helm release reloader to v2.2.8 ([#401](https://github.com/pelotech/foundation/issues/401)) ([b4bcceb](https://github.com/pelotech/foundation/commit/b4bcceba75c8adf3f7bdaa6cbbf9fee77adc318e))

## [4.0.2](https://github.com/pelotech/foundation/compare/v4.0.1...v4.0.2) (2026-02-19)


### Chores

* **multus:** bump memory ([#395](https://github.com/pelotech/foundation/issues/395)) ([63aa597](https://github.com/pelotech/foundation/commit/63aa597621adc76106794403327b7aeacfac56d7))

## [4.0.1](https://github.com/pelotech/foundation/compare/v4.0.0...v4.0.1) (2026-02-14)


### Chores

* bump Multus to v4.2.3 thick ([#393](https://github.com/pelotech/foundation/issues/393)) ([b228c90](https://github.com/pelotech/foundation/commit/b228c9089eb12d4eacee3751811bb779258722f1))

## [4.0.0](https://github.com/pelotech/foundation/compare/v3.0.2...v4.0.0) (2026-01-27)


### ⚠ BREAKING CHANGES

* switch http node port to 81 to support pod identity on port 80 ([#382](https://github.com/pelotech/foundation/issues/382))

### Features

* switch http node port to 81 to support pod identity on port 80 ([#382](https://github.com/pelotech/foundation/issues/382)) ([1bd26be](https://github.com/pelotech/foundation/commit/1bd26beb25e5cea4af478295a5e3a012d09099bf))


### Chores

* **deps:** pin dependencies ([#381](https://github.com/pelotech/foundation/issues/381)) ([6e6734b](https://github.com/pelotech/foundation/commit/6e6734baa5ab06fff579c9b1b5c6e715a285cdaf))
* **deps:** update helm release aws-ebs-csi-driver to v2.55.0 ([#384](https://github.com/pelotech/foundation/issues/384)) ([a93a5e1](https://github.com/pelotech/foundation/commit/a93a5e1a34218dcaf848da219ddad7aaf996de4e))
* **deps:** update helm release aws-load-balancer-controller to v3 ([#383](https://github.com/pelotech/foundation/issues/383)) ([ab111cb](https://github.com/pelotech/foundation/commit/ab111cb1714cd107c3910892c0d45ee63a942b89))
* **deps:** update helm release ingress-nginx to v4.14.2 ([#385](https://github.com/pelotech/foundation/issues/385)) ([8b693c8](https://github.com/pelotech/foundation/commit/8b693c88d83f688dbcebc4bce8d9a7f315c73809))
* pin github action version renovate ([f56ae21](https://github.com/pelotech/foundation/commit/f56ae21f32f3dfab372b4d659630706b8c8e41e6))

## [3.0.2](https://github.com/pelotech/foundation/compare/v3.0.1...v3.0.2) (2026-01-16)


### Chores

* **deps:** update dependency pelotech/nidhogg to v0.8.0 ([#368](https://github.com/pelotech/foundation/issues/368)) ([d249dd5](https://github.com/pelotech/foundation/commit/d249dd573ce25f8d53f9f683253e7dbcd507f943))
* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v1.0.4 ([#369](https://github.com/pelotech/foundation/issues/369)) ([15941ed](https://github.com/pelotech/foundation/commit/15941ed721c3f76cfac3a72156389e0d553ee97f))
* **deps:** update helm release aws-load-balancer-controller to v1.17.1 ([#367](https://github.com/pelotech/foundation/issues/367)) ([f556856](https://github.com/pelotech/foundation/commit/f556856c7584a807ca9a48ef2d14f9a3e404c5a4))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v2.3.0 ([#366](https://github.com/pelotech/foundation/issues/366)) ([096199d](https://github.com/pelotech/foundation/commit/096199db8cbb9ea742031785092fe4ae225e32b5))
* **deps:** update helm release external-dns to v1.20.0 ([#370](https://github.com/pelotech/foundation/issues/370)) ([1c09647](https://github.com/pelotech/foundation/commit/1c09647c1b2dc96d6bb4f2cdab69502db7e823e1))
* **deps:** update helm release kyverno to v3.6.2 ([#371](https://github.com/pelotech/foundation/issues/371)) ([8d1c218](https://github.com/pelotech/foundation/commit/8d1c2188cd340a3377fbf68237ef1dcece23b016))

## [3.0.1](https://github.com/pelotech/foundation/compare/v3.0.0...v3.0.1) (2026-01-13)


### Bug Fixes

* correct release-please versioning for cert-manager ([eeb16a5](https://github.com/pelotech/foundation/commit/eeb16a52cc4214f478ae1968a97d78dc251d64c0))

## [3.0.0](https://github.com/pelotech/foundation/compare/v2.9.13...v3.0.0) (2026-01-13)


### ⚠ BREAKING CHANGES

* move cert-manager to components ([#377](https://github.com/pelotech/foundation/issues/377))
* move ingress-controller to component ([#376](https://github.com/pelotech/foundation/issues/376))
* move ebs-csi to components ([#374](https://github.com/pelotech/foundation/issues/374))

### Refactors

* move cert-manager to components ([#377](https://github.com/pelotech/foundation/issues/377)) ([037f0c8](https://github.com/pelotech/foundation/commit/037f0c814f98ee41c21dc299eff0a6ba466594c3))
* move ebs-csi to components ([#374](https://github.com/pelotech/foundation/issues/374)) ([6401325](https://github.com/pelotech/foundation/commit/6401325869f259b1dd2ae876896ad36e405ba52a))
* move ingress-controller to component ([#376](https://github.com/pelotech/foundation/issues/376)) ([fb36a21](https://github.com/pelotech/foundation/commit/fb36a2180e3a1cfcf63a595bcbd791e9d191e46d))

## [2.9.13](https://github.com/pelotech/foundation/compare/v2.9.12...v2.9.13) (2025-12-17)


### Chores

* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v1.0.3 ([#355](https://github.com/pelotech/foundation/issues/355)) ([e1b6a5a](https://github.com/pelotech/foundation/commit/e1b6a5aa64653bf9c3b7285fd3b5c50a1cd34fdb))
* **deps:** update helm release aws-ebs-csi-driver to v2.54.1 ([#360](https://github.com/pelotech/foundation/issues/360)) ([a8df22e](https://github.com/pelotech/foundation/commit/a8df22ed8e686804688f371e25b0f719d2e4912a))
* **deps:** update helm release cert-manager to v1.19.2 ([#354](https://github.com/pelotech/foundation/issues/354)) ([891222d](https://github.com/pelotech/foundation/commit/891222d34c394de2b10a4686e0b6c9f7cd81eb33))
* **deps:** update helm release crossplane to v2.1.3 ([#351](https://github.com/pelotech/foundation/issues/351)) ([2f271d2](https://github.com/pelotech/foundation/commit/2f271d26d0e38812de59baf3933ee7ae9b00bd92))
* **deps:** update helm release goldilocks to v10.2.0 ([#361](https://github.com/pelotech/foundation/issues/361)) ([c0011de](https://github.com/pelotech/foundation/commit/c0011de11b26748a95e2e7b1cc96f80dae4785e0))
* **deps:** update helm release ingress-nginx to v4.14.1 ([#353](https://github.com/pelotech/foundation/issues/353)) ([4e8b9c4](https://github.com/pelotech/foundation/commit/4e8b9c43d833179b6f8da074737e407d9fe93d1f))
* **deps:** update helm release reloader to v2.2.7 ([#356](https://github.com/pelotech/foundation/issues/356)) ([32907c7](https://github.com/pelotech/foundation/commit/32907c7756960a2aebbe88d7402d1eebd222129b))

## [2.9.12](https://github.com/pelotech/foundation/compare/v2.9.11...v2.9.12) (2025-12-17)


### Chores

* **cdi:** bump to 1.64.0 ([#359](https://github.com/pelotech/foundation/issues/359)) ([2ee2b76](https://github.com/pelotech/foundation/commit/2ee2b760bd2427122a4b4551f02ffb0c890f00bd))
* **deps:** update helm release kyverno to v3.6.1 ([#352](https://github.com/pelotech/foundation/issues/352)) ([df929e9](https://github.com/pelotech/foundation/commit/df929e9318c6198dc8a43b30ca205f88a4ece2bc))

## [2.9.11](https://github.com/pelotech/foundation/compare/v2.9.10...v2.9.11) (2025-12-17)


### Bug Fixes

* **host-network:** remove famous 8080 where it's needed ([#362](https://github.com/pelotech/foundation/issues/362)) ([5d91b1d](https://github.com/pelotech/foundation/commit/5d91b1dc8bb978cecdc4e294ba44bc3a6bbb092d))

## [2.9.10](https://github.com/pelotech/foundation/compare/v2.9.9...v2.9.10) (2025-12-13)


### Chores

* **karpenter:** bump to v1.8.3x ([#357](https://github.com/pelotech/foundation/issues/357)) ([a9b28b7](https://github.com/pelotech/foundation/commit/a9b28b77d682beda09110cb3266d51e375776a77))

## [2.9.9](https://github.com/pelotech/foundation/compare/v2.9.8...v2.9.9) (2025-11-30)


### Bug Fixes

* upgrade argocd patch version and enabled server side diff by default ([86f6a9b](https://github.com/pelotech/foundation/commit/86f6a9bc42faee72fee8e837dc20470aa3f4c9e3))


### Chores

* **deps:** update dependency kubernetes-csi/external-snapshotter to v8.4.0 ([#330](https://github.com/pelotech/foundation/issues/330)) ([8b45cf0](https://github.com/pelotech/foundation/commit/8b45cf0e24f72df4c3f4a119e8c69999b618b98c))
* **deps:** update ghcr.io/k8snetworkplumbingwg/multus-cni docker tag to v4.2.3 ([#334](https://github.com/pelotech/foundation/issues/334)) ([37e8c1a](https://github.com/pelotech/foundation/commit/37e8c1a42f712f6212c120eb6c8743dea5bb2c30))

## [2.9.8](https://github.com/pelotech/foundation/compare/v2.9.7...v2.9.8) (2025-11-30)


### Chores

* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v1 ([#341](https://github.com/pelotech/foundation/issues/341)) ([d7731ef](https://github.com/pelotech/foundation/commit/d7731ef3070300e719dab241cbd84f851d6947f0))
* **deps:** update helm release aws-ebs-csi-driver to v2.53.0 ([#343](https://github.com/pelotech/foundation/issues/343)) ([addb7b6](https://github.com/pelotech/foundation/commit/addb7b63c3cb67dd907032694b92478adec17047))
* **deps:** update helm release aws-load-balancer-controller to v1.16.0 ([#344](https://github.com/pelotech/foundation/issues/344)) ([b327ff2](https://github.com/pelotech/foundation/commit/b327ff2bb0db4ac9c00fbafa20a5ce09d46fe4fb))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v2.2.1 ([#342](https://github.com/pelotech/foundation/issues/342)) ([bda0749](https://github.com/pelotech/foundation/commit/bda074991b123c8ac671ab84e2284a9283a87751))
* **deps:** update helm release crossplane to v2.1.1 ([#340](https://github.com/pelotech/foundation/issues/340)) ([ded9ede](https://github.com/pelotech/foundation/commit/ded9ede865991e208b98dc310b81b658659af5e8))
* **deps:** update helm release ingress-nginx to v4.14.0 ([#338](https://github.com/pelotech/foundation/issues/338)) ([562c5d5](https://github.com/pelotech/foundation/commit/562c5d55325e1f7ad2c088dd11d04ba206f6be7b))
* **deps:** update helm release kyverno to v3.6.0 ([#283](https://github.com/pelotech/foundation/issues/283)) ([3662159](https://github.com/pelotech/foundation/commit/366215982f08cdb9a9b339d0ead3c7f7b1063b46))

## [2.9.7](https://github.com/pelotech/foundation/compare/v2.9.6...v2.9.7) (2025-11-28)


### Bug Fixes

* virt-operator node affinity ([#347](https://github.com/pelotech/foundation/issues/347)) ([c03f855](https://github.com/pelotech/foundation/commit/c03f8556ca61a61d1b5b7d7d049c162fc119a9d7))

## [2.9.6](https://github.com/pelotech/foundation/compare/v2.9.5...v2.9.6) (2025-11-28)


### Chores

* **deps:** update actions/checkout action to v6 ([#345](https://github.com/pelotech/foundation/issues/345)) ([274e0c1](https://github.com/pelotech/foundation/commit/274e0c1d8fd6038448d4c8fa293c73cc52ca8fdd))
* **deps:** update KubeVirt 1.7 + common-instancetypes to v1.5.1 ([#329](https://github.com/pelotech/foundation/issues/329)) ([9e3c9ce](https://github.com/pelotech/foundation/commit/9e3c9ce07b9732a26c32934f3cc2abd701d81982))

## [2.9.5](https://github.com/pelotech/foundation/compare/v2.9.4...v2.9.5) (2025-11-07)


### Chores

* **deps:** update argocd to v3.2.0 ([c176b27](https://github.com/pelotech/foundation/commit/c176b274863734e4f86815e055acd003dbb209a7))
* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v0.14.0 ([#331](https://github.com/pelotech/foundation/issues/331)) ([32ce460](https://github.com/pelotech/foundation/commit/32ce460052902fa48502c99f74288a1cce15c2c9))
* **deps:** update helm release aws-ebs-csi-driver to v2.52.1 ([#333](https://github.com/pelotech/foundation/issues/333)) ([c4033fb](https://github.com/pelotech/foundation/commit/c4033fb3a9b63f78d48520a942549bb1dd1fb243))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v2.2.0 ([#335](https://github.com/pelotech/foundation/issues/335)) ([05046df](https://github.com/pelotech/foundation/commit/05046dfd6768aa4ba96cd45b14546ba14f7ac512))
* **deps:** update helm release reloader to v2.2.5 ([#339](https://github.com/pelotech/foundation/issues/339)) ([a5699a5](https://github.com/pelotech/foundation/commit/a5699a5be1eb11badf3d50055258359fbbabfcae))

## [2.9.4](https://github.com/pelotech/foundation/compare/v2.9.3...v2.9.4) (2025-10-19)


### Chores

* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v0.13.0 ([#325](https://github.com/pelotech/foundation/issues/325)) ([561552b](https://github.com/pelotech/foundation/commit/561552bd9f020179f723cf7d0015aef612c5ee57))
* **deps:** update helm release aws-ebs-csi-driver to v2.50.1 ([#317](https://github.com/pelotech/foundation/issues/317)) ([5b49506](https://github.com/pelotech/foundation/commit/5b49506fae5b7d27d5f7b2f4d2e3bbabcb446116))
* **deps:** update helm release aws-ebs-csi-driver to v2.51.0 ([#326](https://github.com/pelotech/foundation/issues/326)) ([70a4f92](https://github.com/pelotech/foundation/commit/70a4f92de46162deb8694373b21c0f3f09ec34e3))
* **deps:** update helm release aws-load-balancer-controller to v1.14.0 ([#318](https://github.com/pelotech/foundation/issues/318)) ([8785062](https://github.com/pelotech/foundation/commit/87850625652ee5f2b410bdcf478421759fbd6d82))
* **deps:** update helm release aws-load-balancer-controller to v1.14.1 ([#328](https://github.com/pelotech/foundation/issues/328)) ([601a9a8](https://github.com/pelotech/foundation/commit/601a9a856f48426654138e7b971a23c6e460c7ad))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v2.1.0 ([#316](https://github.com/pelotech/foundation/issues/316)) ([5d32685](https://github.com/pelotech/foundation/commit/5d326856556232a1c922fbd81f4dac92fab8773a))
* **deps:** update helm release cert-manager to v1.19.0 ([#319](https://github.com/pelotech/foundation/issues/319)) ([e9a991a](https://github.com/pelotech/foundation/commit/e9a991a6c661279f904e18ecd29344ca0830a3b8))
* **deps:** update helm release cert-manager to v1.19.1 ([#327](https://github.com/pelotech/foundation/issues/327)) ([38fba3e](https://github.com/pelotech/foundation/commit/38fba3e9cadb24a2f595880196d4edb3f49ee5b6))
* **deps:** update helm release ingress-nginx to v4.13.3 ([#313](https://github.com/pelotech/foundation/issues/313)) ([6bbd1db](https://github.com/pelotech/foundation/commit/6bbd1db8fb996caf51e40c79acb8c4282e21a4be))

## [2.9.3](https://github.com/pelotech/foundation/compare/v2.9.2...v2.9.3) (2025-10-09)


### Bug Fixes

* **karpenter:** re-apply 1.7.1x fork ([#322](https://github.com/pelotech/foundation/issues/322)) ([ebb2c31](https://github.com/pelotech/foundation/commit/ebb2c31464fc581274872701325dd99334cb0506))

## [2.9.2](https://github.com/pelotech/foundation/compare/v2.9.1...v2.9.2) (2025-10-01)


### Chores

* **kubevirt:** version bump for solved risky bug ([#314](https://github.com/pelotech/foundation/issues/314)) ([13c4667](https://github.com/pelotech/foundation/commit/13c4667d3d5169c564c86a6404220291635f5688))

## [2.9.1](https://github.com/pelotech/foundation/compare/v2.9.0...v2.9.1) (2025-09-26)


### Chores

* Update cdi to 1.63.1 ([#312](https://github.com/pelotech/foundation/issues/312)) ([da9dc6d](https://github.com/pelotech/foundation/commit/da9dc6da42c863fe03044455bcfb823d85f37c75))
* Update kubevirt to 1.6.1 ([#309](https://github.com/pelotech/foundation/issues/309)) ([2229a8c](https://github.com/pelotech/foundation/commit/2229a8c2367a123a2b2ef4e999cf2f16f9577615))

## [2.9.0](https://github.com/pelotech/foundation/compare/v2.8.8...v2.9.0) (2025-09-25)


### Features

* Update Karpenter to v1.7.1 and use NodeOverlay instead of IGNORE_RESOURCE_REQUESTS ([#305](https://github.com/pelotech/foundation/issues/305)) ([7fd9732](https://github.com/pelotech/foundation/commit/7fd9732ccd5e25aec011ca698f66bd1bb1124528))


### Chores

* **deps:** update helm release aws-ebs-csi-driver to v2.49.1 ([#306](https://github.com/pelotech/foundation/issues/306)) ([4a38301](https://github.com/pelotech/foundation/commit/4a38301987bc59e0320f6aeeabc38fae7dc5fbb7))
* **deps:** update helm release reloader to v2.2.3 ([#303](https://github.com/pelotech/foundation/issues/303)) ([044b35c](https://github.com/pelotech/foundation/commit/044b35c3d3187932152b94fbc7860e1f08d551f9))

## [2.8.8](https://github.com/pelotech/foundation/compare/v2.8.7...v2.8.8) (2025-09-12)


### Bug Fixes

* enabled metrics to ensure ports is on the pod for k8s to schedule correctly ([6a42144](https://github.com/pelotech/foundation/commit/6a421443c1ef9e92daeca9cf4d1f688e78a771a9))

## [2.8.7](https://github.com/pelotech/foundation/compare/v2.8.6...v2.8.7) (2025-09-12)


### Chores

* **deps:** update helm release crossplane to v2 ([#281](https://github.com/pelotech/foundation/issues/281)) ([115a1c5](https://github.com/pelotech/foundation/commit/115a1c5c15b4836fe5d59299d25a37c8f96e52ad))
* **deps:** update helm release external-dns to v1.19.0 ([#300](https://github.com/pelotech/foundation/issues/300)) ([865a694](https://github.com/pelotech/foundation/commit/865a694555304f5ce230028e92a2963961043f51))

## [2.8.6](https://github.com/pelotech/foundation/compare/v2.8.5...v2.8.6) (2025-09-07)


### Chores

* **deps:** update helm release ingress-nginx to v4.13.2 ([#297](https://github.com/pelotech/foundation/issues/297)) ([db08f17](https://github.com/pelotech/foundation/commit/db08f17feff1e100e82758e11163ecaa606b46a7))
* **deps:** upgrade to latest argocd version which includes security fixes ([d1b9666](https://github.com/pelotech/foundation/commit/d1b9666e79bf04a09151772fa2a55943b47241ce))

## [2.8.5](https://github.com/pelotech/foundation/compare/v2.8.4...v2.8.5) (2025-08-29)


### Bug Fixes

* allow for the the mountpoint pods namespace to be created in mount-s3 ([8af1b1d](https://github.com/pelotech/foundation/commit/8af1b1dba8dd23598baf125ef95ef881aa85a5a3))

## [2.8.4](https://github.com/pelotech/foundation/compare/v2.8.3...v2.8.4) (2025-08-29)


### Chores

* **deps:** update helm release aws-mountpoint-s3-csi-driver to v2 ([#261](https://github.com/pelotech/foundation/issues/261)) ([4ab12bf](https://github.com/pelotech/foundation/commit/4ab12bf823b2babdb8bf60af63cefd1954d96c4e))
* **deps:** update helm release goldilocks to v10.1.0 ([#291](https://github.com/pelotech/foundation/issues/291)) ([03056e6](https://github.com/pelotech/foundation/commit/03056e62418bd6d4afac55163f32b6d63d74b5d4))
* **deps:** update helm release k8s-monitoring to v3.3.2 ([#249](https://github.com/pelotech/foundation/issues/249)) ([5788dc1](https://github.com/pelotech/foundation/commit/5788dc14a4a8a8d5df3e0d39cae3ff07287fbcfe))
* **deps:** update helm release reloader to v2.2.2 ([#293](https://github.com/pelotech/foundation/issues/293)) ([aacbbd0](https://github.com/pelotech/foundation/commit/aacbbd08b4643394393f24d496dbe88064885ff9))

## [2.8.3](https://github.com/pelotech/foundation/compare/v2.8.2...v2.8.3) (2025-08-29)


### Bug Fixes

* set AWS_DEFAULT_REGION to us-east-1 for external-dns for cross account config to com from gov ([82702f5](https://github.com/pelotech/foundation/commit/82702f571c425132289a0501db292c5be5f0630a))

## [2.8.2](https://github.com/pelotech/foundation/compare/v2.8.1...v2.8.2) (2025-08-28)


### Bug Fixes

* **deps:** update helm release aws-ebs-csi-driver to v2.48.0 ([#290](https://github.com/pelotech/foundation/issues/290)) ([77594ba](https://github.com/pelotech/foundation/commit/77594ba98ba32709d47a8d8833e60a9d0f3d3362))
* switch to sig helm chart instead of bitnami for external-dns ([f75ee2e](https://github.com/pelotech/foundation/commit/f75ee2e03630d6c191503d4dc9d7efd5c7d76311))


### Chores

* update to allow most conventional commits into the release notes ([3d06d67](https://github.com/pelotech/foundation/commit/3d06d672c628818f11ca71032af79bea11c03345))

## [2.8.1](https://github.com/pelotech/foundation/compare/v2.8.0...v2.8.1) (2025-08-14)


### Bug Fixes

* upgrade helm secrets, kubectl, sops, and vals ([6efede6](https://github.com/pelotech/foundation/commit/6efede65e9cb56e8f1ae000ae72def04fbf3b77e))

## [2.8.0](https://github.com/pelotech/foundation/compare/v2.7.9...v2.8.0) (2025-08-14)


### Features

* upgrade to argocd 3.1.0 with full oci artifact support ([3a7d7c8](https://github.com/pelotech/foundation/commit/3a7d7c897c7facc383dbc0b488b9a42f52685b72))


### Bug Fixes

* **deps:** update actions/checkout action to v5 ([#284](https://github.com/pelotech/foundation/issues/284)) ([1901484](https://github.com/pelotech/foundation/commit/19014842855e45caad3d3a6be0bffcda7a4bba18))
* **deps:** update helm release external-dns to v9.0.3 ([#287](https://github.com/pelotech/foundation/issues/287)) ([6b55f50](https://github.com/pelotech/foundation/commit/6b55f50f78da57a1eddb9757aedb0eb6e3ff6b47))
* **deps:** update helm release goldilocks to v10 ([#286](https://github.com/pelotech/foundation/issues/286)) ([d94a97b](https://github.com/pelotech/foundation/commit/d94a97bae20f1cf88fd8731ea62fa96b246f2c5f))
* **deps:** update helm release ingress-nginx to v4.13.1 ([#285](https://github.com/pelotech/foundation/issues/285)) ([b622aa5](https://github.com/pelotech/foundation/commit/b622aa57cc28dd22688c27df12b45039daf2b336))

## [2.7.9](https://github.com/pelotech/foundation/compare/v2.7.8...v2.7.9) (2025-08-10)


### Bug Fixes

* revert kyverno till 1.15.1 is out for fix to hook ([7b28bc9](https://github.com/pelotech/foundation/commit/7b28bc9cf309c5b18d0f37d231385cc7396f3799))

## [2.7.8](https://github.com/pelotech/foundation/compare/v2.7.7...v2.7.8) (2025-08-10)


### Bug Fixes

* **deps:** update helm release aws-ebs-csi-driver to v2.47.0 ([#278](https://github.com/pelotech/foundation/issues/278)) ([5fb568c](https://github.com/pelotech/foundation/commit/5fb568ca630a5b51efe42006efaf75a9eec4fcd1))
* **deps:** update helm release aws-load-balancer-controller to v1.13.4 ([#272](https://github.com/pelotech/foundation/issues/272)) ([d79bb09](https://github.com/pelotech/foundation/commit/d79bb098eddffbe9776306693bdebe59c23340d2))
* **deps:** update helm release crossplane to v1.20.1 ([#280](https://github.com/pelotech/foundation/issues/280)) ([e246f59](https://github.com/pelotech/foundation/commit/e246f598cd30f20c765c57a97745fa5838e5dabd))
* **deps:** update helm release external-dns to v9.0.2 ([#277](https://github.com/pelotech/foundation/issues/277)) ([2c07c4f](https://github.com/pelotech/foundation/commit/2c07c4fe7dd97fc602e1a73810bd6ab9d99c4d92))
* **deps:** update helm release goldilocks to v9.2.0 ([#269](https://github.com/pelotech/foundation/issues/269)) ([c771252](https://github.com/pelotech/foundation/commit/c77125214c3f2d2d61c42eabb939763d6f8f6bb6))
* **deps:** update helm release kyverno to v3.5.0 ([#266](https://github.com/pelotech/foundation/issues/266)) ([dd92463](https://github.com/pelotech/foundation/commit/dd92463b7d7f9b72b11b4e1dd85f3119ee4bb94b))
* **deps:** update helm release reloader to v2.2.0 ([#262](https://github.com/pelotech/foundation/issues/262)) ([150c72a](https://github.com/pelotech/foundation/commit/150c72a34056e4bf3039a48c91dc841b927e3cd3))

## [2.7.7](https://github.com/pelotech/foundation/compare/v2.7.6...v2.7.7) (2025-08-05)


### Bug Fixes

* bump Multus to v4.2.2 ([#275](https://github.com/pelotech/foundation/issues/275)) ([caefa7d](https://github.com/pelotech/foundation/commit/caefa7d25e31c2bc73046b7d57b57ec61fd7d854))

## [2.7.6](https://github.com/pelotech/foundation/compare/v2.7.5...v2.7.6) (2025-08-05)


### Bug Fixes

* revert "bump Multus to v4.2.2 ([#270](https://github.com/pelotech/foundation/issues/270))" ([#273](https://github.com/pelotech/foundation/issues/273)) ([f16e728](https://github.com/pelotech/foundation/commit/f16e728f52b9ab6de518460f0f827bf051ddc4c1))

## [2.7.5](https://github.com/pelotech/foundation/compare/v2.7.4...v2.7.5) (2025-08-04)


### Bug Fixes

* bump Multus to v4.2.2 ([#270](https://github.com/pelotech/foundation/issues/270)) ([9d023c9](https://github.com/pelotech/foundation/commit/9d023c9bb479678e08f7c893a8e61eaa693b849a))

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
