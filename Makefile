.PHONY: ansible terraform

ansible:
	(cd ansible && ansible-playbook -i inventory/hosts.cfg playbook.yaml)

terraform:
	(cd terraform && terraform apply)
