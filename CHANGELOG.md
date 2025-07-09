# Changelog

## [1.1.5](https://github.com/pelotech/foundation/compare/v2.6.7...v1.1.5) (2025-07-09)


### ⚠ BREAKING CHANGES

* move external-dns to components ([#164](https://github.com/pelotech/foundation/issues/164))
* separate out the various app project by category ([#144](https://github.com/pelotech/foundation/issues/144))

### Features

* Add `multus` component ([f9e5ec2](https://github.com/pelotech/foundation/commit/f9e5ec24e373271a61de68e5d7b21fe5d6ceb861))
* Add `uswitch/nidhogg` to manage node taints for multus. ([151f854](https://github.com/pelotech/foundation/commit/151f854d8a357ee86804b093cbb29d452280a676))
* Add `VolumeSnapshot` CRDs and controller. ([5a7a5f4](https://github.com/pelotech/foundation/commit/5a7a5f4cb56a134bd7da692af87f8bbf1f0d52b5))
* Add `VolumeSnapshot` CRDs and controller. ([77891dc](https://github.com/pelotech/foundation/commit/77891dcdd1a295e96beb90bce5100a75d98b3ddb))
* Add Cilium component for use with Multus. ([4ffac1a](https://github.com/pelotech/foundation/commit/4ffac1a740e45fd45fa99cd2741ef7d2b253aa94))
* add crossplane ([b5d63f7](https://github.com/pelotech/foundation/commit/b5d63f77289182f5790c140352e53039e2189a69))
* Add devenv instructions to tools README ([1d5e4a7](https://github.com/pelotech/foundation/commit/1d5e4a7af91feb2c6fb322b1e17fa7ae82ea2d88))
* Add devenv to repo for dev tool management ([068c094](https://github.com/pelotech/foundation/commit/068c09418953bc1632dbaac6ad994126992b0790))
* Add devenv to repo for dev tool management ([537bfa7](https://github.com/pelotech/foundation/commit/537bfa72892959f33ad70aca8c3dfd5c4e618390))
* add initial devcontainer configuration ([fb7dd44](https://github.com/pelotech/foundation/commit/fb7dd4435093a0ada3830f01be106e1c793e3cc0))
* add karpenter component ([ebf3bd9](https://github.com/pelotech/foundation/commit/ebf3bd928fef79293bbb2219481eb0561e29beed))
* add kyverno component ([#116](https://github.com/pelotech/foundation/issues/116)) ([88610c0](https://github.com/pelotech/foundation/commit/88610c0ddba564bf578123087bfcd7ccd8509eb8))
* add loadbalancer for external access to tailscale, query the services dns name to query the ips to add to tailscale to get direct access ([a302286](https://github.com/pelotech/foundation/commit/a3022861116cd6aec07b6425b83c3412185f8e6c))
* Add Multus to cluster components. ([f36263a](https://github.com/pelotech/foundation/commit/f36263afe77425629527adc8787170077919cf33))
* add pre-commit checks ([31b662a](https://github.com/pelotech/foundation/commit/31b662a5764f8f023c8b2acab8aeab9a687cc857))
* add release/notes to tags ([0e99c9c](https://github.com/pelotech/foundation/commit/0e99c9c442a0d9250c1493b67ca6b2bf0f8a9601))
* add snapshotscheduler ([7b2fe98](https://github.com/pelotech/foundation/commit/7b2fe98a574f9019d14313b92ae396cb04d687a9))
* add the ability to set SOPS_AGE_KEY for the repo server ([5886427](https://github.com/pelotech/foundation/commit/58864273f308cfaa7bdb755a4d5108075c2e06a6))
* add to foundation stack way to provision custom EKS access entries ([#80](https://github.com/pelotech/foundation/issues/80)) ([cc6a00b](https://github.com/pelotech/foundation/commit/cc6a00b9aa7eb84004ace0661ffa320726eb37bd))
* add tsc-frequency to Karpenter ignored requests ([42a0f2a](https://github.com/pelotech/foundation/commit/42a0f2a590059a1fe009ecbc42523e4dd90119ef))
* add version to resources as well ([c6ac301](https://github.com/pelotech/foundation/commit/c6ac301491359139c82b7c142e72fdcce1ba3f01))
* add VPC endpoints ([#125](https://github.com/pelotech/foundation/issues/125)) ([fa90c95](https://github.com/pelotech/foundation/commit/fa90c958cc2699d85d80555d4891364742cd053b))
* add VPC endpoints (bis) ([4da22c4](https://github.com/pelotech/foundation/commit/4da22c421960f16bdfd9db5ab46c35c42204b431))
* Add whereabouts app to ArgoCD via Bitnami chart. ([79b22d9](https://github.com/pelotech/foundation/commit/79b22d91294adcd8b9a6dd9142963acb394478ea))
* add yaml and tf lint, publish kustomizations via OCI. Will still need to refactor at a future date ([faa3556](https://github.com/pelotech/foundation/commit/faa3556878cb62a31714c74ec3b71ba8d3bf927f))
* adding S3 CSI to foundation ([dc47f8c](https://github.com/pelotech/foundation/commit/dc47f8c88c2690b86f1674079bca456ef0dde333))
* allow exec from argocd ([4775f23](https://github.com/pelotech/foundation/commit/4775f23dd4a83070563fd303bccb1aaa931a4f92))
* allow for the taints and other managed node group properties to be modified ([4cb4228](https://github.com/pelotech/foundation/commit/4cb4228d03cdbb05dbd9f956d16b1feb5aac3dc0))
* allow oob symlinks for uki-code:ukilrn-courses ([1b910e5](https://github.com/pelotech/foundation/commit/1b910e5b1ed8c030c2359e4d67e4c2af276dbad5))
* bring back image updater for dev environments ([f11c17a](https://github.com/pelotech/foundation/commit/f11c17a0aeddcb0c49e741659e44aab17d125b6f))
* bump ArgoCD to v2.14.2 ([#135](https://github.com/pelotech/foundation/issues/135)) ([e72cd35](https://github.com/pelotech/foundation/commit/e72cd35c1cd87af100b258a599c265b6c1151dd2))
* bump Karpenter module to 20.24.3 ([#82](https://github.com/pelotech/foundation/issues/82)) ([e548ee1](https://github.com/pelotech/foundation/commit/e548ee1ac9ba9b716b6b637cbc36eb3981f65223))
* bump Karpenter to modified 1.0.5 ([d849f78](https://github.com/pelotech/foundation/commit/d849f782494c98a23a874cee87a708b2efe52b2b))
* bump Karpenter to v1.0.8x ([#113](https://github.com/pelotech/foundation/issues/113)) ([aa3c825](https://github.com/pelotech/foundation/commit/aa3c825550b0f7fe36efc41342eabb4383331186))
* bump Karpenter to v1.1.0x ([#121](https://github.com/pelotech/foundation/issues/121)) ([f3acf4f](https://github.com/pelotech/foundation/commit/f3acf4fafb73171a42abbf4e5575a2b20b918781))
* bump Karpenter to v1.2.1x ([#130](https://github.com/pelotech/foundation/issues/130)) ([073c2c7](https://github.com/pelotech/foundation/commit/073c2c7a5cb2786208aefa8f9422aaee4106acb0))
* bump Karpenter to v1.3.3x ([#162](https://github.com/pelotech/foundation/issues/162)) ([eaa3ddb](https://github.com/pelotech/foundation/commit/eaa3ddbfe654cf992488c22fc83b7d87cf908601))
* bump KubeVirt to 1.5.0 ([#161](https://github.com/pelotech/foundation/issues/161)) ([a59d52e](https://github.com/pelotech/foundation/commit/a59d52e1baf7623f47aa0c3638b88223761a4b57))
* bump version to support user scripts ([90603ee](https://github.com/pelotech/foundation/commit/90603eea0880694ade9294f9b229c4cf25ef6b41))
* **components:** grafana-k8s-monitoring app ([#172](https://github.com/pelotech/foundation/issues/172)) ([73ce693](https://github.com/pelotech/foundation/commit/73ce69363c7d6b704557363649130654877fd939))
* Configure Multus to wait for `aws-vpc-cni`. ([f44c3c9](https://github.com/pelotech/foundation/commit/f44c3c9fa3a6649662627b83cec9276c11d637d7))
* default to empty list extra EKS access entries for convenience ([ef85c98](https://github.com/pelotech/foundation/commit/ef85c9864f0c58dc1a04462fa9af15bba5395ebb))
* enable 'live migration' KubeVirt FG ([9e12a84](https://github.com/pelotech/foundation/commit/9e12a843ae9c46c798cf7b6347574cd5386a490f))
* enable helm-secrets for argocd ([#149](https://github.com/pelotech/foundation/issues/149)) ([a870f55](https://github.com/pelotech/foundation/commit/a870f5598fd4529170e1df532210cd3d0fbc502e))
* enable karpenter node repair ([eb0e7e1](https://github.com/pelotech/foundation/commit/eb0e7e195d159bbbfa08f0473bc53506d1ed9e6c))
* enable renovate ([ff8d6f8](https://github.com/pelotech/foundation/commit/ff8d6f80fe9a62bca71c1158ad371585627957d5))
* enable spot to spot consolidation (karpenter) ([074b4db](https://github.com/pelotech/foundation/commit/074b4db0db7c3ea9bc65ca6622f29c3cf906d67b))
* enabled tflint and validate config ([cfb695b](https://github.com/pelotech/foundation/commit/cfb695b337118fa69e9c1c63ca90adae9ac7cb0d))
* expand kubevirt disks feature gate ([#110](https://github.com/pelotech/foundation/issues/110)) ([31c4087](https://github.com/pelotech/foundation/commit/31c40872599efde012a31baecdc7af6721861640))
* gp3 volume expansion ([#109](https://github.com/pelotech/foundation/issues/109)) ([48302d8](https://github.com/pelotech/foundation/commit/48302d8ab9070c955f948f3a1f211b80da9d8417))
* groups for access entries ([#114](https://github.com/pelotech/foundation/issues/114)) ([94019c4](https://github.com/pelotech/foundation/commit/94019c4fa7b976729f9cfe044a12f62e15dc01d9))
* initial foundation-stack TF module ([2471aed](https://github.com/pelotech/foundation/commit/2471aed4dcefcfdb2cf6ecd3c694dd4b0d9e2f72))
* Karpenter supporting ignoring custom request patterns ([#87](https://github.com/pelotech/foundation/issues/87)) ([cd4043c](https://github.com/pelotech/foundation/commit/cd4043cd1d56636a123cb4b224832de31e2680f7))
* move dv cloning permissions to a cluster role ([#120](https://github.com/pelotech/foundation/issues/120)) ([ff0c1de](https://github.com/pelotech/foundation/commit/ff0c1de9b05788ca65431ac865b1e7e2d07cd578))
* move external-dns to components ([#164](https://github.com/pelotech/foundation/issues/164)) ([c78694c](https://github.com/pelotech/foundation/commit/c78694c754863751a24a51bb7dfa81f7d7fc93fd))
* multus and cni related are system-node-critical items ([c4a9b15](https://github.com/pelotech/foundation/commit/c4a9b15ab2ea434aa2d9718903323fc0fa2e2ea5))
* nginx in a separate argo app and helm vs kustomize ([#227](https://github.com/pelotech/foundation/issues/227)) ([c0e7f30](https://github.com/pelotech/foundation/commit/c0e7f30e98cfcf16a284fad67081a2126932413d))
* nidhogg release 0.6.5 ([#137](https://github.com/pelotech/foundation/issues/137)) ([61e378a](https://github.com/pelotech/foundation/commit/61e378a5a230b04d444c3ad3ac6ec3549645df33))
* parameterize initial node group instance type ([13df978](https://github.com/pelotech/foundation/commit/13df9786657aa6f9db8b3cb47e52d93558e60436))
* pull whereabouts into it's down application deployment ([2d02280](https://github.com/pelotech/foundation/commit/2d022809b39e1d6e8e487899ed9c354a5ee2cfe0))
* remove gp2 class and only allow gp3 storage ([46cc2b7](https://github.com/pelotech/foundation/commit/46cc2b73e5017c18694e75bc1112ac6c26c63936))
* remove image updater from the base into components ([9b17dae](https://github.com/pelotech/foundation/commit/9b17daeec62d1dd3e5dfdba1dad16ac6d9b50485))
* **renovate:** Use terser (and more flexible) config syntax. ([#224](https://github.com/pelotech/foundation/issues/224)) ([ee55bb5](https://github.com/pelotech/foundation/commit/ee55bb5d34b05125057e1669e6de59280ef690de))
* separate out the various app project by category ([#144](https://github.com/pelotech/foundation/issues/144)) ([d1362eb](https://github.com/pelotech/foundation/commit/d1362eb9de6812f2adb513132cf0dfe8286ccb47))
* splitout nidhogg from multus ([9911588](https://github.com/pelotech/foundation/commit/991158892157d05fe3142a25d73923106a2e36d9))
* support existing buckets for csi driver ([#78](https://github.com/pelotech/foundation/issues/78)) ([ac6e7b5](https://github.com/pelotech/foundation/commit/ac6e7b51fd49b4a6d4e1d0ec15e885c258466691))
* switch to the pelotech nidhogg from github registry ([b3954f3](https://github.com/pelotech/foundation/commit/b3954f38d01ef5f7895cc885d6d646c44707805b))
* switch to use published kustomize in the nidhogg repo ([5860506](https://github.com/pelotech/foundation/commit/58605064f85d6f58c87d4a71316543e4d07434a5))
* switching to gp3 as default vs gp2 ([97705af](https://github.com/pelotech/foundation/commit/97705afc2333ed0ee9f2112a10fec1d60db34cf7))
* update to start the switch to add kube-ovn and multus as the al… ([774ad97](https://github.com/pelotech/foundation/commit/774ad97c8821748e754257f5fad026642eaad7b3))
* update to start the switch to add kube-ovn and multus as the alternative cni configuration ([d2cf3a0](https://github.com/pelotech/foundation/commit/d2cf3a05631183ab33d446cd1458d3691aafc719))
* update to track from labels to labels and annotations - allows for apps in any namespace ([db37698](https://github.com/pelotech/foundation/commit/db37698231f7a04a62aac85f84782f920bc7dd21))
* update to use release-please ([#132](https://github.com/pelotech/foundation/issues/132)) ([24658b7](https://github.com/pelotech/foundation/commit/24658b77a877f28a680269cd76b790692912ad8a))
* updating multus to the think plugin ([1a1f405](https://github.com/pelotech/foundation/commit/1a1f4055b44cd93c709134de618b8ffe7cf1f0f9))
* upgrade argocd to 3.0.5 ([#219](https://github.com/pelotech/foundation/issues/219)) ([8539d73](https://github.com/pelotech/foundation/commit/8539d73bf5616e70548701fb8d0ba14be3e7e4bb))
* upgrade ebs csi and snapshotting ([fc658f1](https://github.com/pelotech/foundation/commit/fc658f1342fa3007b1d598a248225a015b01e127))
* upgrade karpenter - remove kube-ovn (installed on cluster creation out of band) ([717be08](https://github.com/pelotech/foundation/commit/717be08866082b53f8818cf0033f8cd97f1c8f82))
* upgrade karpenter - remove kube-ovn (installed on cluster creation out of band) ([30ee478](https://github.com/pelotech/foundation/commit/30ee478fd6ed532646ea59b50410a7f9a715f04d))
* upgrade karpenter, add cluster name label to ebs, docs ([ace43b4](https://github.com/pelotech/foundation/commit/ace43b4526b558363148714190200bd19db8b641))
* upgrade latest version of argocd ([c7a2877](https://github.com/pelotech/foundation/commit/c7a28778f6df62a8d1a394c1cfef1902f74577f8))
* upgrade of all the foundation components to the latest version ([a548f2b](https://github.com/pelotech/foundation/commit/a548f2b3e7c06dffdff566c0dab3a27bfb3f0c46))
* upgrade snapshot-controller to the latest, upgrade argocd and add memory to argo server ([d4fd8b6](https://github.com/pelotech/foundation/commit/d4fd8b60a83426e21af0ddb132cd30d8d96c60c8))
* upgrade to 2.10.5 - fixes some issues especially in prep for HA ([f029934](https://github.com/pelotech/foundation/commit/f029934bf3d6806f16d6a0012367eed9f1402ec9))
* upgrade to argocd 3.0 and latest image updater chart ([b6d79f7](https://github.com/pelotech/foundation/commit/b6d79f7220be7ef85bb181269a84a93e313eee51))
* upgrade to argocd v2.10.0 ([d6c8dc3](https://github.com/pelotech/foundation/commit/d6c8dc3def622f24f60a088cbf0ea62e14d5c774))
* upgrade to kubevirt 1.1.1 and cdi 1.58.0 ([589ebb8](https://github.com/pelotech/foundation/commit/589ebb8878b3dccd66d8ee3579d79afebc0d9fd3))
* Use ArgoCD-compatible `reloadStrategy`. ([e8cdc3b](https://github.com/pelotech/foundation/commit/e8cdc3b4742a04a19035019ff19e91291e5a2499))
* use modified KubeVirt image and enable feature gates: numa, cpumanager, sidecar ([b535c85](https://github.com/pelotech/foundation/commit/b535c85c5a523a1788f479f7dc6c17a1b6a7d23d))


### Bug Fixes

* Add `multi-home-networking` tolerations to KubeVirt CR. ([fd6cfa7](https://github.com/pelotech/foundation/commit/fd6cfa7fd3e2c7462bb6f6334aa550970a9ed665))
* add additional variables for updated module ([94ee85f](https://github.com/pelotech/foundation/commit/94ee85fde51f87da78f09532981931fee17ed693))
* add kube-node-lease namespace ([30312f6](https://github.com/pelotech/foundation/commit/30312f6460a74138216b10b1c39026f72691cb4f))
* add kubevirt as an application ([be94607](https://github.com/pelotech/foundation/commit/be94607af0f9943a403ed65972c90de766277ea7))
* add kyverno source repo and ns to ArgoCD ([7ebbda2](https://github.com/pelotech/foundation/commit/7ebbda232d6ad1272931ca27ed9132096a5b2ae6))
* add memory req for adot ([4fd9bec](https://github.com/pelotech/foundation/commit/4fd9bec43e12f5949037d065cf71ccee99fd8c51))
* add missing source for storage app project ([bea481d](https://github.com/pelotech/foundation/commit/bea481dda1f66b20423d53bd8011aa93726ae74a))
* add oci registry to admins, allow whereabouts on all nodes ([42b8fac](https://github.com/pelotech/foundation/commit/42b8facb3cd15ce3c9413e4a516210fd14601c4b))
* add permissions required for leases ([2bb515f](https://github.com/pelotech/foundation/commit/2bb515f6e80650adc85b1de7446b799ff51daeea))
* add toleration to the alb controller ([385f521](https://github.com/pelotech/foundation/commit/385f521405c4e2ca3f9c6d9d59531eb5d7bd6dc5))
* add tolerations to extra argocd components ([066d700](https://github.com/pelotech/foundation/commit/066d7003554a5554ab8e868910eac4a04a4ebf77))
* add tolerations to kubevirt ([0a0240e](https://github.com/pelotech/foundation/commit/0a0240e61325822f3db8c1767d2af5c10c6c21be))
* add watch file for readiness ([c418d0c](https://github.com/pelotech/foundation/commit/c418d0c52e000110f6651a36bc79ff232b70b23b))
* adding the nodeSelector for Kubevirt, remove staticip patch due to switch to kube-ovn ([67ba789](https://github.com/pelotech/foundation/commit/67ba7896cd1a36597b995f6b698b71c0ae6bd844))
* adding the tolerations for argocd ([75b78cb](https://github.com/pelotech/foundation/commit/75b78cb1cf9be680b4813b023042ddbfa1328385))
* alb controller port to include : for the address, switch to ' instead of escaping " ([5e8d244](https://github.com/pelotech/foundation/commit/5e8d244209d68b93101fd01544c6328acf85fcd5))
* align naming on built-in cdi roles ([96ecba8](https://github.com/pelotech/foundation/commit/96ecba80168bcf50ea08b89033c40e4d054a7383))
* allow no gpg key to exist ([ee90e6a](https://github.com/pelotech/foundation/commit/ee90e6a6a84f5fcc9f12983457ea9b28e4382ab0))
* allow to run on criticaladdonsonly node ([13db08c](https://github.com/pelotech/foundation/commit/13db08c9e5bca7516cf417283a1aab3972e4521c))
* bad helm version update to 25 instead of 35 ([d39b260](https://github.com/pelotech/foundation/commit/d39b2609fdef339de02f762d6e08b7a9bdc1d40a))
* bool vs string to keep node SA from being created ([f6810d2](https://github.com/pelotech/foundation/commit/f6810d2bc3eda3668bf0895658a26d5dfbd4a211))
* Clean up Multus pod toleration of Nidhogg-managed taint. ([2648ef3](https://github.com/pelotech/foundation/commit/2648ef338b2b4e8b79dd5f27051ea435c4ed366a))
* Configure Cilium to tunnel using Geneve. ([a8ca998](https://github.com/pelotech/foundation/commit/a8ca998e78190e03ec153133bd786ebd7b7a4a9a))
* copypasta typo fix ([29259b3](https://github.com/pelotech/foundation/commit/29259b3838231312537dd5b2ce57d952fb080be8))
* correct the fieldpaths for loki ([ffdf847](https://github.com/pelotech/foundation/commit/ffdf847db861e7fb2517542dbaae8cb505c51fd2))
* **deps:** update dependency kubevirt/common-instancetypes to v0.4.1 ([#168](https://github.com/pelotech/foundation/issues/168)) ([7e79745](https://github.com/pelotech/foundation/commit/7e797453c3927c60fff0bcb47e23fc13238ec1f1))
* **deps:** update dependency kubevirt/common-instancetypes to v1.3.1 ([#126](https://github.com/pelotech/foundation/issues/126)) ([a2aeb0b](https://github.com/pelotech/foundation/commit/a2aeb0b29396cf1ab5670c4ff6a7140092e6f2bc))
* **deps:** update ghcr.io/argoproj/argo-helm/argocd-image-updater docker tag to v0.12.2 ([#213](https://github.com/pelotech/foundation/issues/213)) ([09c76af](https://github.com/pelotech/foundation/commit/09c76affc5864664065c102f90d938293398fb6e))
* **deps:** update helm release aws-ebs-csi-driver to v2.43.0 ([#176](https://github.com/pelotech/foundation/issues/176)) ([7df9396](https://github.com/pelotech/foundation/commit/7df9396943a2b182729ebeb355d83ca9d0116a6a))
* **deps:** update helm release aws-load-balancer-controller to v1.13.0 ([#178](https://github.com/pelotech/foundation/issues/178)) ([6629126](https://github.com/pelotech/foundation/commit/66291261a2bf7a34cb45dd0608b74bc30e07fcda))
* **deps:** update helm release aws-load-balancer-controller to v1.13.1 ([#200](https://github.com/pelotech/foundation/issues/200)) ([2f006d4](https://github.com/pelotech/foundation/commit/2f006d4636ad36617e8da8e6cfe629c3e797b43a))
* **deps:** update helm release aws-load-balancer-controller to v1.13.2 ([#203](https://github.com/pelotech/foundation/issues/203)) ([fe7db24](https://github.com/pelotech/foundation/commit/fe7db246aa0582f0700d4be41f08ee3c1363f019))
* **deps:** update helm release aws-mountpoint-s3-csi-driver to v1.14.1 ([#179](https://github.com/pelotech/foundation/issues/179)) ([ab7a400](https://github.com/pelotech/foundation/commit/ab7a400810b5ee9bde1ba5f8a71bf585587427ec))
* **deps:** update helm release cert-manager to v1.17.2 ([#180](https://github.com/pelotech/foundation/issues/180)) ([05ac978](https://github.com/pelotech/foundation/commit/05ac9786a90e9aa172b9214992f865676af79ad0))
* **deps:** update helm release crossplane to v1.19.1 ([#181](https://github.com/pelotech/foundation/issues/181)) ([ec01dca](https://github.com/pelotech/foundation/commit/ec01dcab1ac3b3717ac2482a3db4e53ce9b55eb4))
* **deps:** update helm release external-dns to v8 ([#189](https://github.com/pelotech/foundation/issues/189)) ([e90d604](https://github.com/pelotech/foundation/commit/e90d60484c3bf758d9182a96862b54d614db1112))
* **deps:** update helm release external-dns to v8.8.3 ([#212](https://github.com/pelotech/foundation/issues/212)) ([d9ec831](https://github.com/pelotech/foundation/commit/d9ec83176ddd24ce840cae2e79ccd6fe5e5a6e2e))
* **deps:** update helm release fluent-bit to v0.49.0 ([#183](https://github.com/pelotech/foundation/issues/183)) ([6bab4c6](https://github.com/pelotech/foundation/commit/6bab4c6c2ccd060f70944c327bcc5793db34890a))
* **deps:** update helm release fluent-bit to v0.49.1 ([#218](https://github.com/pelotech/foundation/issues/218)) ([e0e71b2](https://github.com/pelotech/foundation/commit/e0e71b2fa9affde37724075eb696e3f71f7f01e1))
* **deps:** update helm release goldilocks to v9 ([#190](https://github.com/pelotech/foundation/issues/190)) ([ec64ccf](https://github.com/pelotech/foundation/commit/ec64ccfe4d915a71613ad75e5120e6bdc183a75f))
* **deps:** update helm release k8s-monitoring to v2.0.29 ([#175](https://github.com/pelotech/foundation/issues/175)) ([324a7cd](https://github.com/pelotech/foundation/commit/324a7cd88e1bd48aabef4fbcba3692415f52f6fd))
* **deps:** update helm release k8s-monitoring to v2.0.30 ([#197](https://github.com/pelotech/foundation/issues/197)) ([245bd32](https://github.com/pelotech/foundation/commit/245bd327d9c30477dafdfd8c9f00bb5e2f4f6fab))
* **deps:** update helm release k8s-monitoring to v2.1.0 ([#202](https://github.com/pelotech/foundation/issues/202)) ([3040a38](https://github.com/pelotech/foundation/commit/3040a38719afe5597b83f3687484d462775f3a08))
* **deps:** update helm release k8s-monitoring to v2.1.1 ([#204](https://github.com/pelotech/foundation/issues/204)) ([e4f0ebd](https://github.com/pelotech/foundation/commit/e4f0ebd2d749bc9f695aaf6af6fe33dd33cb0b06))
* **deps:** update helm release k8s-monitoring to v2.1.4 ([#206](https://github.com/pelotech/foundation/issues/206)) ([156fba9](https://github.com/pelotech/foundation/commit/156fba9b1560d327480540ce365aec719ae5cf8b))
* **deps:** update helm release kyverno to v3.4.1 ([#184](https://github.com/pelotech/foundation/issues/184)) ([c62ffb0](https://github.com/pelotech/foundation/commit/c62ffb0b87321834a4f0497380076c6a20dae7e6))
* **deps:** update helm release loki to v5.48.0 ([#185](https://github.com/pelotech/foundation/issues/185)) ([5128c94](https://github.com/pelotech/foundation/commit/5128c94c0531d99be4b28c3fd922f67e96830b78))
* **deps:** update helm release loki to v6 ([#191](https://github.com/pelotech/foundation/issues/191)) ([2444506](https://github.com/pelotech/foundation/commit/24445063a8fff25102f4ff575cd3e704170cbb3d))
* **deps:** update helm release loki to v6.30.1 ([#209](https://github.com/pelotech/foundation/issues/209)) ([d250efc](https://github.com/pelotech/foundation/commit/d250efc7076639222c3a0f23779096b295105c0b))
* **deps:** update helm release reloader to v2 ([#192](https://github.com/pelotech/foundation/issues/192)) ([68877a6](https://github.com/pelotech/foundation/commit/68877a66cf621c8f6df6445e56a3666a1b59144c))
* **deps:** update helm release snapscheduler to v3.5.0 ([#198](https://github.com/pelotech/foundation/issues/198)) ([3717e18](https://github.com/pelotech/foundation/commit/3717e18834fe96eb8cc0da92edbef80c61ab0524))
* disable gpg sops for helm secrets ([0903d29](https://github.com/pelotech/foundation/commit/0903d2940f0edc68a06d6adcc52017800a38c2c1))
* Does this need a JSON object here? ([7dda606](https://github.com/pelotech/foundation/commit/7dda6061e074fd92ca95796ce5df68a198257ec0))
* Double ArgoCD application-controller memory. ([8f5e6d2](https://github.com/pelotech/foundation/commit/8f5e6d299e004fc6176b6d6fc902aa8cf16107ba))
* elevated CPU throttling: 33.33% throttling of CPU for ebs-csi-node ([526609c](https://github.com/pelotech/foundation/commit/526609c931ef3d9abc711d73eea3bfad29e583c7))
* enable webhook for transition ([ccc9834](https://github.com/pelotech/foundation/commit/ccc983417b2de8fad495c37c53dbd8ae038d8697))
* extraEnv path ([82bc3cd](https://github.com/pelotech/foundation/commit/82bc3cd58dcde94963b3ac8ffcb11081db8bfe4b))
* filename typo ([fd2e34f](https://github.com/pelotech/foundation/commit/fd2e34f885f3f48292776930ce3e28f7c8a93287))
* fluent-bit should have priority-class ([aad1cab](https://github.com/pelotech/foundation/commit/aad1cab9311304e4cea7fd5d9395cd2b0c6202ff))
* fsGroup is not a string ([4ce4af7](https://github.com/pelotech/foundation/commit/4ce4af767f0e7af5a536bed45c1f4a1e0a9cb6cf))
* helm chart isn't published yet, revert to older version ([657cdae](https://github.com/pelotech/foundation/commit/657cdae068449c39db28c2da15f4c08d9d44831f))
* increase initial asg specs for kube-ovn ([#123](https://github.com/pelotech/foundation/issues/123)) ([beddbf0](https://github.com/pelotech/foundation/commit/beddbf026c74394db87c59fba333eba0fa96c110))
* increase memory ([f31c0c9](https://github.com/pelotech/foundation/commit/f31c0c9e3a58017fcb18a5992a9cc3d0bcce691b))
* increase ram and cpu for the applicationset, application, and repo-server ([6e997f5](https://github.com/pelotech/foundation/commit/6e997f579ee7f319ec42bf5f0e5000e8ff7a5c5c))
* install deps for pre-commit ([001cd0f](https://github.com/pelotech/foundation/commit/001cd0f2bece88e14850ae6e0fd48ce0a3429b17))
* install deps for pre-commit ([94610c9](https://github.com/pelotech/foundation/commit/94610c91d78fde30a302891b4c9b89599b0e5ffe))
* issues with tailscale on get nlb ip ([a141c23](https://github.com/pelotech/foundation/commit/a141c23698d4e8904bf2f6ee6b2a655d675276f1))
* karpenter image digest ([7fd182f](https://github.com/pelotech/foundation/commit/7fd182fde3ef3a28ba0c6d625cd83e196f415aa3))
* Karpenter replacements path ([9d1c2b3](https://github.com/pelotech/foundation/commit/9d1c2b3ddce2306cf6daa3d2968a5cb64b5f579f))
* Karpenter svc namespace for conversion webhook ([#85](https://github.com/pelotech/foundation/issues/85)) ([21642f6](https://github.com/pelotech/foundation/commit/21642f6e814e5a60aec5e305e0af1c73adc1178c))
* karpenter upgrade to 1.5.1 ([45b77b9](https://github.com/pelotech/foundation/commit/45b77b9ec87e72a303affd483b9320cf1f9e6efb))
* keep changes to a minimum in main - make the implementation switch to kube-ovn with patches ([f930426](https://github.com/pelotech/foundation/commit/f930426feb57147eddab92b5448984a97d973bdb))
* kubevirt virt-api scheduling ([#142](https://github.com/pelotech/foundation/issues/142)) ([447853f](https://github.com/pelotech/foundation/commit/447853fac1135ff7539e6b7ec3507a6695e84421))
* **kyverno:** update to latest helm chart and bind metrics port to not 8080 ([#235](https://github.com/pelotech/foundation/issues/235)) ([3da6de4](https://github.com/pelotech/foundation/commit/3da6de4da044626aa1b5de35bdd9f6007e16a2ff))
* label value needs to be a string ([8e93e1b](https://github.com/pelotech/foundation/commit/8e93e1b457549b5e3879aacf38be7f8b6ce6f64b))
* move the operator and crds into phase -1 ([9c7df56](https://github.com/pelotech/foundation/commit/9c7df56aefa41e610cf778b375e92ef11cac8dac))
* move the parameters to values to help fix the default annotations ([568a9bc](https://github.com/pelotech/foundation/commit/568a9bca97bf69e0e10ac034426d67fd89aefa62))
* multus v4 multus binary install ([#107](https://github.com/pelotech/foundation/issues/107)) ([3f33b96](https://github.com/pelotech/foundation/commit/3f33b963a8af164b3bc2424e85067630db472459))
* namespace initial nodegroups ([7029c19](https://github.com/pelotech/foundation/commit/7029c19d0660a7610962f45971c7742d2804eb3b))
* namespace the nlb name to match the cluster name to be unique ([cfa10db](https://github.com/pelotech/foundation/commit/cfa10db2550d5dae090f5b505bc280d3f8bf4e1f))
* namespace the nlb name to match the cluster name to be unique ([1dc756c](https://github.com/pelotech/foundation/commit/1dc756ce0d0100a1677ea9a475f0cb396d9515eb))
* needs to be able to run on the  creticalAddonsonly ([c2e1521](https://github.com/pelotech/foundation/commit/c2e15214c6009bc6d49c63479c602d3b88fe513b))
* nidhogg node placement ([#140](https://github.com/pelotech/foundation/issues/140)) ([fe20c4d](https://github.com/pelotech/foundation/commit/fe20c4d3abfe2a9e4d2dc26d964dcaffe1dfc4d7))
* oci registry fix and enable-ssl-passthrough fix ([8bdd476](https://github.com/pelotech/foundation/commit/8bdd476353d85e3258fb66525e71a246ed7f232b))
* order matters for init containers ([#151](https://github.com/pelotech/foundation/issues/151)) ([9bb32b6](https://github.com/pelotech/foundation/commit/9bb32b62dee837c4c7f764b8d83dbfd14bfd172f))
* path update ([8267425](https://github.com/pelotech/foundation/commit/8267425fa570cdfbb4f5e1f6ed7def7bb630fef3))
* pre-commit ([e322216](https://github.com/pelotech/foundation/commit/e322216ba30e9e52e975a355892abff8d60e7660))
* prefixed with /host ([c983b6c](https://github.com/pelotech/foundation/commit/c983b6cd98fa4e15f391c05eb311f2d93caade04))
* put the CRDs first ([06e1f3c](https://github.com/pelotech/foundation/commit/06e1f3c49172000b431d5a1624ee1222d4dcb53a))
* Put the KubeVirt patch in the right place. ([53e83db](https://github.com/pelotech/foundation/commit/53e83dba203979b1823c5251033a82ab5c9318d3))
* quick fix due to ordering issue - need a long term better solution ([9600add](https://github.com/pelotech/foundation/commit/9600adddba0d3fda79f971d8a0350b683b2a76a5))
* refactor all foundation to use valuesObject instead of parameter… ([26eff96](https://github.com/pelotech/foundation/commit/26eff96e9d03cf22095fcad9df3fb85f1b438ba3))
* refactor all foundation to use valuesObject instead of parameters or values, also removed TF modules which are no longer needed and started the example terraform ([772421d](https://github.com/pelotech/foundation/commit/772421d96ee533a9a3d5c769e590231aa49fd2bf))
* refactor all the service accounts to be created via the helm tem… ([26284cc](https://github.com/pelotech/foundation/commit/26284cc0892cefb6703023a22dff77e5e86da970))
* refactor all the service accounts to be created via the helm template vs in the argocd kustomizations ([83b7a0c](https://github.com/pelotech/foundation/commit/83b7a0cdea3db3a26cbcebb83298117832565276))
* refactor kube-virt ([8cfece2](https://github.com/pelotech/foundation/commit/8cfece2760d8c6a8156531147133b514aef33fb2))
* refactor path ([fe338ff](https://github.com/pelotech/foundation/commit/fe338ff23d8f3806b804c9a5d66ad21bd8650ec3))
* Remove copy-pasted parameters from Cilium app. ([4af7fba](https://github.com/pelotech/foundation/commit/4af7fba99b6b6018815843b83ecdb32a18d622cf))
* remove duplicate reference since it's currently installed in the default argo application ([9cc582c](https://github.com/pelotech/foundation/commit/9cc582cddaee9b9e08cc0d9526715925497249e5))
* remove hostnetwork from nidhogg ([#215](https://github.com/pelotech/foundation/issues/215)) ([0e765a5](https://github.com/pelotech/foundation/commit/0e765a5e6aa48dbf4c98a7b016bbae7c44c83da4))
* remove nidhogg time delay ([#166](https://github.com/pelotech/foundation/issues/166)) ([2351e69](https://github.com/pelotech/foundation/commit/2351e693b5a35ecf111461211a9be8c9557d81d9))
* remove service account from the argocd application to the ebs-csi app - first test, initial "replacement" of the arn with the helm chart ([d72670a](https://github.com/pelotech/foundation/commit/d72670a8193625842d2acbe0775d359175e051eb))
* remove uneeded cluster endpoint when karpenter can autodiscover ([75267e0](https://github.com/pelotech/foundation/commit/75267e04c3a852dbed15daa1f690e6a5b890dc97))
* remove uneeded target ports ([f694384](https://github.com/pelotech/foundation/commit/f6943849294d4459d84691b575c2f1e969d671d1))
* remove unused appproject and update readme with missing source/destinations ([cdccfc7](https://github.com/pelotech/foundation/commit/cdccfc74560e0551f0a63c1208aa9fdb3b18356d))
* remove v from helm version ([5fd60b1](https://github.com/pelotech/foundation/commit/5fd60b18219192a4b219c370f1e336beaafef884))
* **renovate:** Avoid absolute path in `managerFilePatterns`. ([#225](https://github.com/pelotech/foundation/issues/225)) ([6d468b9](https://github.com/pelotech/foundation/commit/6d468b91894580d311c0759129269a2cc9cc8d57))
* Replace `values` with `parameters` in Cilium app. ([54c55d5](https://github.com/pelotech/foundation/commit/54c55d56a15c369ff5e3de3bfb5f40d21700717c))
* revert Karpenter since we're managing a fork ([57c7127](https://github.com/pelotech/foundation/commit/57c71273d0cea636b518ccf36c508d17c6c45a1c))
* revert ksops container version back till merged with helm-secrets ([b92072b](https://github.com/pelotech/foundation/commit/b92072bd642d5ff58aa797c42d91d69518819879))
* revert multus back to 3.9.3 - 4.x had more changes than anticipated ([7d0a3c6](https://github.com/pelotech/foundation/commit/7d0a3c65b69e3d607a60826720608f8cc50fe546))
* revert to affinity ([a8525cd](https://github.com/pelotech/foundation/commit/a8525cdcd569c561a96530fffa19c65e7e852b32))
* set data to empty instead of null to add additional values ([bcd0ec2](https://github.com/pelotech/foundation/commit/bcd0ec2108c850e8152898831bb30a7971db2ab8))
* set terraform version ([77d16fa](https://github.com/pelotech/foundation/commit/77d16fac6729e92397069b2babb2bd98e7d4fc0a))
* Sidestep issue with complex annotation key. ([8a78796](https://github.com/pelotech/foundation/commit/8a787962936ecf9d9b89ee0bc9e51e0177f8a435))
* Specify `AWS_REGION` to support cert-manager GovCloud. ([bff65c4](https://github.com/pelotech/foundation/commit/bff65c4accf846a6a2983fb3863b15ad74790663))
* Specify AWS_REGION to support cert-manager GovCloud. ([a2371d1](https://github.com/pelotech/foundation/commit/a2371d186bc607433a26f0f44bb1ad6004df311f))
* split out the snapshotter from the driver ([52ed136](https://github.com/pelotech/foundation/commit/52ed136084b970f6bb49e4759710744a0e89d28d))
* switch from instance to IP to get better target group reporting ([b82056b](https://github.com/pelotech/foundation/commit/b82056bb7b5aa38e36d29cff648b501fcd989862))
* switch to have the application deploy both the helm chart as well as the source repo for the snapshot, add the sync wave to deploy the snapshot configuration first, try defaulting to the correct storageclass and storage snapshot ([88fc635](https://github.com/pelotech/foundation/commit/88fc635f04a12c5993a8ffd6b2aab6ff6f1d161e))
* tag to the think version of the container ([b680cba](https://github.com/pelotech/foundation/commit/b680cba69d9c1d90f1e47d100539f3b3e2b6de3c))
* temp revert of crossplane version update and move to hostNetwork ([cafacf0](https://github.com/pelotech/foundation/commit/cafacf063068a3738c1c8b65b549ddb66959a107))
* tolerate uki-labs taint, use nodeselector instead of affinity ([7b21b8e](https://github.com/pelotech/foundation/commit/7b21b8ecfec99798cc246ec12be98c92ef5cf80a))
* Try configuring Cilium CNI for host-local connectivity. ([737a8d4](https://github.com/pelotech/foundation/commit/737a8d48b32bf601c542c8fc40d3674bab52ab13))
* typo ([09a83a9](https://github.com/pelotech/foundation/commit/09a83a94e96b64ec057fc93ab3ca7a8a086b9db5))
* typo in cm key ([8ebae6d](https://github.com/pelotech/foundation/commit/8ebae6d823b21584d1b2f6537f03529cff53d666))
* update adot to actually create the service account. looks like there was a left over config that was incorrect ([fa0ecbb](https://github.com/pelotech/foundation/commit/fa0ecbb06be0f9565a3d90a8791100c87128471e))
* update annotation to the connect name ([83652ca](https://github.com/pelotech/foundation/commit/83652ca937ab01958c2a4ae1516b28a57cfff03d))
* update digest ([fbc9c10](https://github.com/pelotech/foundation/commit/fbc9c10f1cbd07385f30ae6bce4d888c0c6a15fa))
* update for default class in chart. Not sure how it ever worked ([083d8bc](https://github.com/pelotech/foundation/commit/083d8bcec524361edbb25c851812fa677b8bc487))
* update helm version and fix dnsPolicy to allow for being on the hostnetwork ([3cd590e](https://github.com/pelotech/foundation/commit/3cd590efde8129551bfc0c9c4e7e4cf7282be927))
* update metrics bind address to not conflict with kube-ovn ping ([e4a698e](https://github.com/pelotech/foundation/commit/e4a698e834101e0adb74e980b2f657f8605aa0e2))
* update missed chart version and name with change to upstream ([3575495](https://github.com/pelotech/foundation/commit/35754950ab4cc2e92d1e1d73bce40534e3fc0035))
* update multus toleration ([93c96cd](https://github.com/pelotech/foundation/commit/93c96cdb277ccb29fdf960dff6b78015df75fa0b))
* update nidhogg to include containerPorts with 8080 metrics ([b8315ce](https://github.com/pelotech/foundation/commit/b8315cee7464ce94588a5e378d03b05698312c05))
* update owner ([5f3031f](https://github.com/pelotech/foundation/commit/5f3031f277bb0d3b03ca37c79b5136498f8aba65))
* update path for base-install ([3d60a8a](https://github.com/pelotech/foundation/commit/3d60a8a69743965c7503aa32433a30b611f25db7))
* update replacement for upstream nginx which has controller object ([4052ccf](https://github.com/pelotech/foundation/commit/4052ccf3507fd8eb4f9f74df6a4dd575a725a663))
* update to 0.21 from 0.15.5 ([df69aba](https://github.com/pelotech/foundation/commit/df69abaa4e043714787c8f43498434628dc37b46))
* update to fix bool conversion ([af66f1e](https://github.com/pelotech/foundation/commit/af66f1e6013be10c615991e81907cde2ef216c83))
* update to get correct port as number as well as annotation value as string instead of bool ([fd8f14d](https://github.com/pelotech/foundation/commit/fd8f14d38ad4b6f41812f93e089f53044d84d88c))
* update to have application create namespace and removed explicit creation ([c30a53d](https://github.com/pelotech/foundation/commit/c30a53de14bf1a8187f04bd04d211b1da03fa3d5))
* update to use public foundation https vs git ([9080ca0](https://github.com/pelotech/foundation/commit/9080ca0233fa9d98f7ed24d853d07d2438a88b5f))
* update to work with oci registry ([a198b72](https://github.com/pelotech/foundation/commit/a198b72fc3e0dd683714f534d89b4b47d77a16cc))
* update webhooks to escape the string vs float with argocd trying to be helpful but not ([0a21c52](https://github.com/pelotech/foundation/commit/0a21c52f1daa96437d38e8713308ef9f3c104865))
* upgrade adot ([16b3936](https://github.com/pelotech/foundation/commit/16b393656433ba6464e45ab22183ceae244ae930))
* upgrade ebs helm version ([6e7ddf2](https://github.com/pelotech/foundation/commit/6e7ddf2c3779282a8af6a891d24b006b1073af6f))
* upgrade karpenter ([d66224f](https://github.com/pelotech/foundation/commit/d66224fc8cfef3bce38500108e5ca4c8e48063a5))
* upgrade nginx 1.10 -&gt; 1.12.1, upgrade alb controller chart 1.7.1 -&gt; 1.12.0 ([84ebbea](https://github.com/pelotech/foundation/commit/84ebbea5c5120f64c1e9c2a737594f3086f478bc))
* upgrade to latest argocd version ([cfed770](https://github.com/pelotech/foundation/commit/cfed770aad6f60910406d1936617624fba91f145))
* use /etc vs /host/etc ([8601e3e](https://github.com/pelotech/foundation/commit/8601e3e6598a597eed26afa833fe4aae617d04ff))
* Use `nodeSelector` and YAML-formatted values. ([e8f36b5](https://github.com/pelotech/foundation/commit/e8f36b51c19c27ff471d5c3aaf3d75bc9faea5ef))
* use existing serviceAccount ([3a1fbc0](https://github.com/pelotech/foundation/commit/3a1fbc009ef3bb3fa4d700ad4b5d1a79132941fd))
* Use Kustomize's property-filtering syntax. ([3848f3f](https://github.com/pelotech/foundation/commit/3848f3f048e23925497771af5e5497778bfea735))
* use port 80/443 and publish service enabled ([af75ffe](https://github.com/pelotech/foundation/commit/af75ffe14a8648a91c62934c59ba7dde35007161))
* use specific group ([c4ac3b6](https://github.com/pelotech/foundation/commit/c4ac3b6cdc5cb95ca7388a3aff07bef1a58a5e0b))
* Use the same YAML fold as everywhere else. ([3f8a23e](https://github.com/pelotech/foundation/commit/3f8a23e0e04171a022f95682dfd688f6162b4f2f))
* use upstream ingress nginx instead of bitnami's ([be383e7](https://github.com/pelotech/foundation/commit/be383e7e7904b3e1854f4a25da277cf8a87b7782))
* utils needs destination for kube-system for karpenter-dns ([8481799](https://github.com/pelotech/foundation/commit/8481799370f64b7f515a54839f6d5844bbb939bf))
* verbs typo ([fa03a07](https://github.com/pelotech/foundation/commit/fa03a0760b5c8743672fafa051b7d7a37536f829))
* volume mount secret optional ([b58d324](https://github.com/pelotech/foundation/commit/b58d324c39acf25f458ffab01712c0ea7c9f4749))


### Miscellaneous Chores

* release 1.1.5 ([7bb5322](https://github.com/pelotech/foundation/commit/7bb532231754b05a27d1019736caa461ac87ee17))

## [2.6.7](https://github.com/pelotech/foundation/compare/v2.6.6...v2.6.7) (2025-07-09)


### Bug Fixes

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
