sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y unzip
sudo apt-get install -y zsh
cp .zshrc ~/
wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
NO_INTERACTIVE=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/subtlepseudonym/oh-my-zsh/feature/install-noninteractive/tools/install.sh)"
unzip terraform_0.12.25_linux_amd64.zip
chmod +x terraform
sudo mv terraform /usr/local/bin
rm terraform_0.12.25_linux_amd64.zip
