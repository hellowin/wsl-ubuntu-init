TERRAFORM_VERSION=0.12.25
GOLANG_VERSION=1.14.3
JAVA_VERSION=14

.PHONY: terraform golang java maven nvm

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
	# ignore error for Java installation due to license problem in GitHub actions pipeline
	sudo apt-get install -y openjdk-$(JAVA_VERSION)-jdk || true

maven:
	sudo apt-get install -y maven

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	grep -qxF 'export NVM_DIR="$$HOME/.nvm"' ~/.zshrc || echo 'export NVM_DIR="$$HOME/.nvm"' >> ~/.zshrc || true
	grep -qxF '[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh"  # This loads nvm' ~/.zshrc || echo '[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc || true
	grep -qxF '[ -s "$$NVM_DIR/bash_completion" ] && \. "$$NVM_DIR/bash_completion"  # This loads nvm bash_completion' ~/.zshrc || echo '[ -s "$$NVM_DIR/bash_completion" ] && \. "$$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc || true
	export NVM_DIR="$$HOME/.nvm"
	[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh"
	[ -s "$$NVM_DIR/bash_completion" ] && \. "$$NVM_DIR/bash_completion"

full: terraform golang java maven nvm
