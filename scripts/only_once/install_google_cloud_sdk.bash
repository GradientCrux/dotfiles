brew install --cask google-cloud-sdk


# Check and add Google Cloud SDK to .zshrc if not present
if ! grep -q "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'" ~/.zshrc; then
    echo "Adding Google Cloud SDK to .zshrc"
    echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'" >> ~/.zshrc
fi

if ! grep -q "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'" ~/.zshrc; then
    echo "Adding Google Cloud SDK completion to .zshrc"
    echo "source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'" >> ~/.zshrc
fi