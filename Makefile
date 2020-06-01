TERRAFORM_VERSION=0.12.25
GOLANG_VERSION=1.14.3
JAVA_VERSION=14

.PHONY: terraform golang java maven

terraform:
	wget https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	unzip terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	chmod +x terraform
	sudo mv terraform /usr/local/bin
	rm terraform_$(TERRAFORM_VERSION)_linux_amd64.zip

golang:
	wget https://dl.google.com/go/go$(GOLANG_VERSION).linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go$(GOLANG_VERSION).linux-amd64.tar.gz
	# ignore error for testing in GitHub action
	grep -qxF 'export PATH=$$PATH:/usr/local/go/bin' ~/.zshrc || echo 'export PATH=$$PATH:/usr/local/go/bin' >> ~/.zshrc || true
	rm go$(GOLANG_VERSION).linux-amd64.tar.gz

java:
	sudo add-apt-repository ppa:linuxuprising/java
	sudo apt-get update
	sudo apt-get install -y openjdk-$(JAVA_VERSION)-jdk

maven:
	sudo apt-get install -y maven

full: terraform golang java maven
