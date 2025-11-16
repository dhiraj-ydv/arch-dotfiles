#!/bin/bash

# Script to fix dotfiles structure
# This will move actual configs from ~/.config/ to ~/dotfiles/
# and create symlinks from ~/.config/ to ~/dotfiles/

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Fixing Dotfiles Structure           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}This will:${NC}"
echo -e "  1. Remove symlinks from ~/dotfiles/"
echo -e "  2. Copy actual configs from ~/.config/ to ~/dotfiles/"
echo -e "  3. Create symlinks from ~/.config/ to ~/dotfiles/"
echo ""
read -p "Continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Cancelled.${NC}"
    exit 0
fi

cd "$DOTFILES_DIR"

# Function to fix structure
fix_config() {
    local name="$1"
    local dotfiles_path="$DOTFILES_DIR/$name"
    local config_path="$CONFIG_DIR/$name"
    
    echo -e "\n${BLUE}Processing $name...${NC}"
    
    # Check if it exists in dotfiles as symlink
    if [ -L "$dotfiles_path" ]; then
        echo -e "${YELLOW}  Removing symlink from dotfiles...${NC}"
        rm "$dotfiles_path"
    elif [ -d "$dotfiles_path" ]; then
        echo -e "${YELLOW}  Already a directory in dotfiles, backing up...${NC}"
        mv "$dotfiles_path" "${dotfiles_path}.old"
    fi
    
    # Check if config exists in .config
    if [ -d "$config_path" ]; then
        echo -e "${GREEN}  Copying $name from .config to dotfiles...${NC}"
        cp -r "$config_path" "$dotfiles_path"
        
        # Backup and remove from .config
        echo -e "${YELLOW}  Backing up and removing from .config...${NC}"
        mv "$config_path" "${config_path}.backup"
        
        # Create symlink from .config to dotfiles
        echo -e "${GREEN}  Creating symlink .config/$name -> dotfiles/$name${NC}"
        ln -s "$dotfiles_path" "$config_path"
        
        echo -e "${GREEN}  ✓ $name fixed${NC}"
    else
        echo -e "${RED}  ✗ $name not found in .config${NC}"
    fi
}

# Fix all config directories
fix_config "hypr"
fix_config "waybar"
fix_config "wofi"
fix_config "wlogout"
fix_config "dunst"
fix_config "kitty"
fix_config "nvim"
fix_config "scripts"

echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Structure Fixed! 🎉                 ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. Review the changes in ~/dotfiles/"
echo -e "  2. Add and commit the actual config files:"
echo -e "     ${YELLOW}cd ~/dotfiles${NC}"
echo -e "     ${YELLOW}git add .${NC}"
echo -e "     ${YELLOW}git commit -m 'fix: Add actual config files instead of symlinks'${NC}"
echo -e "     ${YELLOW}git push${NC}"
echo ""
echo -e "${YELLOW}Note: Backups are saved as .backup in ~/.config/${NC}"
echo ""
