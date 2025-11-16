#!/bin/bash

# Dotfiles Installation Script
# This script moves config directories from Downloads/dotfiles to ~/.config
# and creates symlinks in ~/dotfiles pointing to ~/.config

set -e

SOURCE_DIR="$HOME/Downloads/dotfiles"
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

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Error: Source directory not found at $SOURCE_DIR${NC}"
    exit 1
fi

# Step 2: Create .config and dotfiles directories if they don't exist
mkdir -p "$CONFIG_DIR"
mkdir -p "$DOTFILES_DIR"

# Function to move directory and create symlinks
move_and_symlink() {
    local dir_name="$1"
    local name="$2"
    local source_path="$SOURCE_DIR/$dir_name"
    local config_path="$CONFIG_DIR/$dir_name"
    local dotfiles_path="$DOTFILES_DIR/$dir_name"

    # Check if directory exists in source
    if [ ! -d "$source_path" ]; then
        echo -e "${YELLOW}⚠  $name not found in source, skipping...${NC}"
        return
    fi

    # Step 1: Handle existing config directory and move from Downloads to .config
    if [ -L "$config_path" ]; then
        echo -e "${YELLOW}⚠  $name is a symlink in .config, removing...${NC}"
        rm "$config_path"
    elif [ -d "$config_path" ]; then
        echo -e "${YELLOW}⚠  $name exists in .config, backing up to ${config_path}.backup${NC}"
        mv "$config_path" "${config_path}.backup"
    fi

    mv "$source_path" "$config_path"
    echo -e "${GREEN}✓  $name moved to .config${NC}"

    # Step 3: Handle existing entry in dotfiles and create symlink
    if [ -L "$dotfiles_path" ]; then
        echo -e "${YELLOW}⚠  $name symlink exists in dotfiles, updating...${NC}"
        rm "$dotfiles_path"
    elif [ -d "$dotfiles_path" ]; then
        echo -e "${YELLOW}⚠  $name directory exists in dotfiles, backing up to ${dotfiles_path}.backup${NC}"
        mv "$dotfiles_path" "${dotfiles_path}.backup"
    fi

    ln -sf "$config_path" "$dotfiles_path"
    echo -e "${GREEN}✓  $name symlinked in dotfiles${NC}"
}

# Move and symlink all config directories
echo -e "\n${GREEN}Moving directories and creating symlinks...${NC}\n"

move_and_symlink "nvim" "Neovim"
move_and_symlink "hypr" "Hyprland"
move_and_symlink "kitty" "Kitty"
move_and_symlink "waybar" "Waybar"
move_and_symlink "wofi" "Wofi"
move_and_symlink "wlogout" "Wlogout"
move_and_symlink "dunst" "Dunst"
move_and_symlink "scripts" "Scripts"

# Make scripts executable
if [ -d "$CONFIG_DIR/scripts" ]; then
    echo -e "\n${GREEN}Making scripts executable...${NC}"
    chmod +x "$CONFIG_DIR/scripts"/*.sh 2>/dev/null || true
    echo -e "${GREEN}✓  Scripts made executable${NC}"
fi

echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Installation Complete! 🎉          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "Config directories moved from ${YELLOW}~/Downloads/dotfiles${NC} to ${YELLOW}~/.config/${NC}"
echo -e "Symlinks created in ${YELLOW}~/dotfiles${NC} pointing to ${YELLOW}~/.config/${NC}"
echo -e "Backups of existing configs are saved as ${YELLOW}.backup${NC}"
echo ""
echo -e "${YELLOW}Note: You may need to restart your applications or re-login for changes to take effect.${NC}"
echo ""
