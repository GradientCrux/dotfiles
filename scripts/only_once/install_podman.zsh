
echo "Installing Podman"
brew install podman

echo "Initializing Podman machine"
podman machine init

echo "Starting Podman machine"
podman machine start

podman info

echo "Installing Podman Compose"
brew install podman-compose

# NOTE: some manual steps are required to install Podman Desktop
echo "Installing Podman Desktop"
brew install podman-desktop
