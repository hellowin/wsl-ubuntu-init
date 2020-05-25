TERRAFORM_VERSION=0.12.25
GOLANG_VERSION=1.14.3

.PHONY: terraform golang

terraform:
	sudo ls
	wget https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	unzip terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	chmod +x terraform
	sudo mv terraform /usr/local/bin
	rm terraform_$(TERRAFORM_VERSION)_linux_amd64.zip

golang:
	wget https://dl.google.com/go/go$(GOLANG_VERSION).linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go$(GOLANG_VERSION).linux-amd64.tar.gz
	grep -qxF 'export PATH=$$PATH:/usr/local/go/bin' ~/.zshrc || echo 'export PATH=$$PATH:/usr/local/go/bin' >> ~/.zshrc
	rm go$(GOLANG_VERSION).linux-amd64.tar.gz

full: terraform golang
