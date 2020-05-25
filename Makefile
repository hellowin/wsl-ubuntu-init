.PHONY: terraform

terraform:
	sudo ls
	wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
	unzip terraform_0.12.25_linux_amd64.zip
	chmod +x terraform
	sudo mv terraform /usr/local/bin
	rm terraform_0.12.25_linux_amd64.zip

full: terraform