
echo "Installing Homebrew"
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to .zprofile"
echo >> /Users/phil/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/phil/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing Applications"


brew install --cask raycast 
brew install google-chrome