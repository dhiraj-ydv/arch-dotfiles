#!/bin/bash

# Package Installation Script
# This script installs all required packages for the dotfiles setup

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Package Installation Script        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if running Arch-based system
if ! command -v pacman &> /dev/null; then
    echo -e "${RED}Error: This script is designed for Arch-based systems with pacman${NC}"
    exit 1
fi

# Check for yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}yay (AUR helper) not found.${NC}"
    read -p "Do you want to install yay? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${GREEN}Installing yay...${NC}"
        cd /tmp
        sudo pacman -S --needed --noconfirm git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ~
        echo -e "${GREEN}✓ yay installed successfully${NC}"
    else
        echo -e "${YELLOW}⚠ Skipping AUR packages installation${NC}"
    fi
else
    echo -e "${GREEN}✓ yay is already installed${NC}"
fi
echo ""

echo -e "${BLUE}This will install the following packages:${NC}"
echo -e "  • Hyprland (Wayland compositor)"
echo -e "  • Kitty (Terminal emulator)"
echo -e "  • Waybar (Status bar)"
echo -e "  • Wofi (Application launcher)"
echo -e "  • Wlogout (Logout menu)"
echo -e "  • Dunst (Notification daemon)"
echo -e "  • Neovim (Text editor)"
echo -e "  • Cliphist (Clipboard manager)"
echo -e "  • wl-clipboard (Wayland clipboard utilities)"
echo -e "  • wtype (Wayland typing tool)"
echo -e "  • Git (Version control)"
echo ""
read -p "Do you want to continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Installation cancelled.${NC}"
    exit 0
fi

echo -e "\n${GREEN}Updating system...${NC}"
sudo pacman -Syu --noconfirm

echo -e "\n${GREEN}Installing packages...${NC}\n"

# Core packages
PACKAGES=(
    # Hyprland and dependencies
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "xdg-desktop-portal-hyprland"
    
    # Terminal and shell
    "kitty"
    
    # Status bar and widgets
    "waybar"
    
    # Application launcher
    "wofi"
    
    # Logout menu
    "wlogout"
    
    # Notifications
    "dunst"
    "libnotify"
    
    # Text editor
    "neovim"
    
    # Clipboard management
    "cliphist"
    "wl-clipboard"
    "wtype"
    
    # File manager
    "thunar"
    "thunar-archive-plugin"
    "file-roller"
    
    # Image viewer
    "imv"
    
    # Screenshot tools
    "grim"
    "slurp"
    
    # Audio
    "pipewire"
    "pipewire-pulse"
    "pipewire-alsa"
    "wireplumber"
    "pavucontrol"
    
    # Brightness control
    "brightnessctl"
    
    # Network
    "networkmanager"
    "network-manager-applet"
    
    # Bluetooth
    "bluez"
    "bluez-utils"
    "blueman"
    
    # Fonts
    "ttf-jetbrains-mono-nerd"
    "ttf-font-awesome"
    "noto-fonts"
    "noto-fonts-emoji"
    
    # System utilities
    "git"
    "wget"
    "curl"
    "unzip"
    "zip"
    "htop"
    "neofetch"
    
    # GTK themes
    "gtk3"
    "gtk4"
)

for package in "${PACKAGES[@]}"; do
    if pacman -Qi "$package" &> /dev/null; then
        echo -e "${YELLOW}⚠  $package already installed, skipping...${NC}"
    else
        echo -e "${GREEN}→ Installing $package...${NC}"
        sudo pacman -S --noconfirm "$package" || echo -e "${RED}✗ Failed to install $package${NC}"
    fi
done

# AUR packages (if yay is available)
if command -v yay &> /dev/null; then
    echo -e "\n${GREEN}Installing AUR packages...${NC}\n"
    
    AUR_PACKAGES=(
        "hyprpicker"
    )
    
    for package in "${AUR_PACKAGES[@]}"; do
        if pacman -Qi "$package" &> /dev/null; then
            echo -e "${YELLOW}⚠  $package already installed, skipping...${NC}"
        else
            echo -e "${GREEN}→ Installing $package from AUR...${NC}"
            yay -S --noconfirm "$package" || echo -e "${RED}✗ Failed to install $package${NC}"
        fi
    done
fi

echo -e "\n${GREEN}Enabling services...${NC}"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║    Installation Complete! 🎉          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. Run ${YELLOW}./symlink.sh${NC} to symlink your dotfiles"
echo -e "  2. Log out and select Hyprland from your display manager"
echo -e "  3. Enjoy your new setup!"
echo ""
