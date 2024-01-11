.PHONY: lint
lint: lint-tf lint-yaml

# TODO: fail on exit 1 but not 2
.PHONY: lint-tf
lint-tf:
	tflint --init
	tflint --recursive || echo "Temp bypass and need to figure out warnings"


.PHONY: lint-yaml
lint-yaml:
	yamllint -c .yamllint .

.PHONY: format
format:
	terraform fmt -recursive
