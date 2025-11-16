#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks from ~/dotfiles to ~/.config

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
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo ""

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}Error: Dotfiles directory not found at $DOTFILES_DIR${NC}"
    exit 1
fi

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    local name="$3"

    if [ -L "$target" ]; then
        echo -e "${YELLOW}⚠  $name already symlinked, skipping...${NC}"
    elif [ -e "$target" ]; then
        echo -e "${YELLOW}⚠  $name exists, backing up to ${target}.backup${NC}"
        mv "$target" "${target}.backup"
        ln -sf "$source" "$target"
        echo -e "${GREEN}✓  $name symlinked${NC}"
    else
        ln -sf "$source" "$target"
        echo -e "${GREEN}✓  $name symlinked${NC}"
    fi
}

# Symlink all config directories
echo -e "\n${GREEN}Creating symlinks...${NC}\n"

create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim" "Neovim"
create_symlink "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr" "Hyprland"
create_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty" "Kitty"
create_symlink "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar" "Waybar"
create_symlink "$DOTFILES_DIR/wofi" "$CONFIG_DIR/wofi" "Wofi"
create_symlink "$DOTFILES_DIR/wlogout" "$CONFIG_DIR/wlogout" "Wlogout"
create_symlink "$DOTFILES_DIR/dunst" "$CONFIG_DIR/dunst" "Dunst"
create_symlink "$DOTFILES_DIR/scripts" "$CONFIG_DIR/scripts" "Scripts"

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
echo -e "Your dotfiles have been symlinked to ~/.config/"
echo -e "Backups of existing configs are saved as ${YELLOW}.backup${NC}"
echo ""
echo -e "${YELLOW}Note: You may need to restart your applications or re-login for changes to take effect.${NC}"
echo ""
