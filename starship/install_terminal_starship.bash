#!/usr/bin/env bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Tool-specific variables
TOOL_NAME="starship"
CONFIG_DIR="starship"

# Function to check if tool is already installed
check_installation() {
    if command -v "$TOOL_NAME" &> /dev/null; then
        echo -e "${BLUE}$TOOL_NAME is already installed${NC}"
        return 0
    fi
    return 1
}

# Function to check for updates if tool is already installed
check_updates() {
    echo -e "${YELLOW}Checking for updates...${NC}"
    if command -v "curl" &> /dev/null; then
        curl -sS https://starship.rs/install.sh | sh -s -- --yes
        echo -e "${GREEN}Starship has been updated to the latest version${NC}"
    else
        echo -e "${RED}Curl is required but not installed${NC}"
        exit 1
    fi
}

# Function to install the tool
install_tool() {
    echo -e "${YELLOW}Installing $TOOL_NAME...${NC}"
    if command -v "curl" &> /dev/null; then
        curl -sS https://starship.rs/install.sh | sh -s -- --yes
        echo -e "${GREEN}Starship has been successfully installed${NC}"
        echo -e "${YELLOW}Creating Starship configuration directory...${NC}"
        mkdir -p ~/.config
        
        # Terminal formatter
        if [ ! -f ~/.zshrc ]; then
            touch ~/.zshrc
        fi

        if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
            echo -e "${YELLOW}Adding Starship to .zshrc...${NC}"
            echo 'eval "$(starship init zsh)"' >> ~/.zshrc
        fi
        echo -e "${YELLOW}Setting up Starship configuration...${NC}"
        if [ ! -f ~/.config/starship.toml ]; then
            starship preset nerd-font-symbols -o ~/.config/starship.toml
        fi

    else
        echo -e "${RED}Curl is required but not installed${NC}"
        exit 1
    fi
}

# Function to verify config directory exists
check_config_dir() {
    if [ ! -d "../$CONFIG_DIR" ]; then
        echo -e "${YELLOW}Creating config directory for $TOOL_NAME${NC}"
        mkdir -p "../$CONFIG_DIR"
    fi
}

# Main execution
main() {
    echo -e "${BLUE}Starting $TOOL_NAME installation check...${NC}"
    
    # Check if config directory exists
    check_config_dir
    
    # Check if already installed
    if check_installation; then
        check_updates
    else
        install_tool
    fi
    
    echo -e "${GREEN}Process completed${NC}"
}

main 