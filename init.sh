sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install unzip
wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip
unzip terraform_0.12.25_linux_amd64.zip
chmod +x terraform
sudo mv terraform /usr/local/bin
rm terraform_0.12.25_linux_amd64.zip
