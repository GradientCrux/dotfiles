#!/usr/bin/env zsh
echo "Installing Just"
brew install just


echo "Installing uv"
brew install uv


echo "Installing ruff"
brew install ruff

echo "Installing pre-commit"
brew install pre-commit

echo "Installing eza (ls alternative)"
brew install eza
# Check and add ls alias if not present
if ! grep -q "alias ls=\"eza\"" ~/.zshrc; then
    echo "Adding ls alias to .zshrc"
    echo '\n# ls replacement\nalias ls="eza"' >> ~/.zshrc
fi


echo "Installing bat (cat alternative)"
brew install bat

# Check and add cat alias if not present
if ! grep -q "alias cat=\"bat\"" ~/.zshrc; then
    echo "Adding cat alias to .zshrc"
    echo '\n# cat replacement\nalias cat="bat"' >> ~/.zshrc
fi




