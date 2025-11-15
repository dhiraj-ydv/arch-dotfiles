# Arch Hyprland Dotfiles

My personal Arch Linux + Hyprland rice configuration files.

## 📦 Components

- **Hyprland** - Wayland compositor with custom animations
- **Waybar** - Status bar with custom styling
- **Wofi** - App launcher with nord-inspired theme
- **Wlogout** - Beautiful logout/power menu
- **Cliphist** - Clipboard manager with wofi integration
- **Dunst** - Notification daemon
- **Kitty** - Terminal emulator
- **Hyprlock** - Screen locker
- **Hyprpaper** - Wallpaper daemon

## 🎨 Theme

Nord-inspired dark theme with cyan/green accents:
- Primary: `#33ccff` (Cyan)
- Secondary: `#00ff99` (Green)
- Background: `#1e1e1e`
- See `colors.conf` for full color scheme

## 🚀 Installation

### Required Packages
```bash
yay -S hyprland waybar wofi dunst kitty hyprlock hyprpaper cliphist wlogout
```

### Setup Dotfiles
```bash
git clone https://github.com/dhiraj-ydv/arch-dotfiles.git ~/dotfiles
cd ~/dotfiles

# Symlink configs (already set up if you cloned to ~/dotfiles)
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/wofi ~/.config/wofi
ln -sf ~/dotfiles/wlogout ~/.config/wlogout
ln -sf ~/dotfiles/dunst ~/.config/dunst
ln -sf ~/dotfiles/kitty ~/.config/kitty
```

### Apply Changes
```bash
hyprctl reload
# Or logout and login
```

## ⌨️ Keybindings

### Essential
- `SUPER + Q` - Terminal (kitty)
- `SUPER + C` - Close window
- `SUPER + D` - App launcher (wofi)
- `SUPER + E` - File manager
- `SUPER + L` - Lock screen
- `SUPER + SHIFT + V` - Clipboard history
- `SUPER + SHIFT + E` - Logout menu (wlogout)

### Window Management
- `SUPER + Arrow Keys` - Move focus
- `SUPER + SHIFT + Arrow Keys` - Move window
- `SUPER + F` - Fullscreen toggle
- `SUPER + V` - Toggle floating
- `ALT + Tab` - Cycle windows

### Workspaces
- `SUPER + 1-9` - Switch to workspace
- `SUPER + SHIFT + 1-9` - Move window to workspace
- `SUPER + Mouse_Scroll` - Switch workspace

### Audio/Brightness
- `XF86AudioRaiseVolume` - Volume up
- `XF86AudioLowerVolume` - Volume down
- `XF86AudioMute` - Mute toggle
- `XF86MonBrightnessUp` - Brightness up
- `XF86MonBrightnessDown` - Brightness down

## 🎯 Features

- **Smooth animations** - Custom bezier curves for fluid transitions
- **Window borders** - Animated gradient borders (cyan/green)
- **Blur effects** - Beautiful background blur on transparent windows
- **Auto-tiling** - Dwindle layout with smart window placement
- **Clipboard history** - Keep track of your clipboard with cliphist
- **Power menu** - Elegant logout/shutdown menu with wlogout
- **Consistent theming** - Unified color scheme across all components

## 🔧 Customization

All configs are in `~/dotfiles/` and symlinked to `~/.config/`. Edit them directly:

- **Colors**: Edit `colors.conf` for consistent theming
- **Borders/Gaps**: Edit `hypr/hyprland.conf` general section
- **Animations**: Edit `hypr/hyprland.conf` animations section
- **Waybar**: Edit `waybar/config` and `waybar/style.css`
- **Wofi**: Edit `wofi/config` and `wofi/style.css`

Changes apply immediately (or after `hyprctl reload`).

## 📁 File Structure

```
dotfiles/
├── hypr/              # Hyprland configs
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   └── hyprpaper.conf
├── waybar/            # Status bar
│   ├── config
│   └── style.css
├── wofi/              # App launcher
│   ├── config
│   └── style.css
├── wlogout/           # Logout menu
│   ├── layout
│   └── style.css
├── dunst/             # Notifications
│   └── dunstrc
├── kitty/             # Terminal
│   ├── kitty.conf
│   └── current-theme.conf
├── scripts/           # Helper scripts
│   └── cliphist.sh
├── colors.conf        # Color scheme
└── README.md
```

## 📝 Notes

- All configs are symlinked - changes in `~/dotfiles/` apply to `~/.config/`
- Clipboard history starts automatically on login
- Waybar power button opens wlogout menu
- See `hypr/hyprland.conf` for full keybinding list

## 🌟 Credits

- Inspired by various Hyprland rice configs
- Nord color scheme influence
- Community wallpapers and themes
