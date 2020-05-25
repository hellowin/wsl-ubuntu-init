sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential
sudo apt-get install -y unzip
sudo apt-get install -y zsh
cp .zshrc ~/
NO_INTERACTIVE=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/subtlepseudonym/oh-my-zsh/feature/install-noninteractive/tools/install.sh)"