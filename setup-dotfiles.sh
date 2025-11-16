#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks from ~/.config to ~/dotfiles
# Actual config files are stored in ~/dotfiles (git repo)

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Dotfiles Installation Script       ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}Error: Dotfiles directory not found at $DOTFILES_DIR${NC}"
    echo -e "${YELLOW}Please clone your dotfiles repository first:${NC}"
    echo -e "  git clone <your-repo-url> ~/dotfiles"
    exit 1
fi

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Function to create symlinks
create_symlink() {
    local dir_name="$1"
    local name="$2"
    local dotfiles_path="$DOTFILES_DIR/$dir_name"
    local config_path="$CONFIG_DIR/$dir_name"

    # Check if directory exists in dotfiles
    if [ ! -d "$dotfiles_path" ]; then
        echo -e "${YELLOW}⚠  $name not found in dotfiles, skipping...${NC}"
        return
    fi

    # Handle existing config directory
    if [ -L "$config_path" ]; then
        echo -e "${YELLOW}⚠  $name symlink already exists, updating...${NC}"
        rm "$config_path"
    elif [ -d "$config_path" ]; then
        echo -e "${YELLOW}⚠  $name exists in .config, backing up to ${config_path}.backup${NC}"
        mv "$config_path" "${config_path}.backup"
    fi

    # Create symlink from .config to dotfiles
    ln -s "$dotfiles_path" "$config_path"
    echo -e "${GREEN}✓  $name symlinked (.config/$dir_name -> dotfiles/$dir_name)${NC}"
}

# Create symlinks for all config directories
echo -e "\n${GREEN}Creating symlinks...${NC}\n"

create_symlink "nvim" "Neovim"
create_symlink "hypr" "Hyprland"
create_symlink "kitty" "Kitty"
create_symlink "waybar" "Waybar"
create_symlink "wofi" "Wofi"
create_symlink "wlogout" "Wlogout"
create_symlink "dunst" "Dunst"
create_symlink "scripts" "Scripts"

# Make scripts executable
if [ -d "$DOTFILES_DIR/scripts" ]; then
    echo -e "\n${GREEN}Making scripts executable...${NC}"
    chmod +x "$DOTFILES_DIR/scripts"/*.sh 2>/dev/null || true
    echo -e "${GREEN}✓  Scripts made executable${NC}"
fi

echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Installation Complete! 🎉          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "Symlinks created from ${YELLOW}~/.config/${NC} to ${YELLOW}~/dotfiles/${NC}"
echo -e "Backups of existing configs are saved as ${YELLOW}.backup${NC}"
echo ""
echo -e "${YELLOW}Note: You may need to restart your applications or re-login for changes to take effect.${NC}"
echo ""
