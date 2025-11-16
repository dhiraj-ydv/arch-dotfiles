# Arch Hyprland Dotfiles

My personal Arch Linux + Hyprland rice configuration files.

## 📦 Components

- **Hyprland** - Wayland compositor with custom animations
- **Waybar** - Status bar with gradient styling and system monitoring
- **Wofi** - App launcher with custom theme
- **Wlogout** - Beautiful logout/power menu with 6 options
- **Cliphist** - Clipboard manager with wofi integration
- **Dunst** - Notification daemon with rounded corners
- **Kitty** - Terminal emulator (Adapta Nokto Maia theme)
- **Neovim** - Text editor with custom configuration
- **Hyprlock** - Screen locker with blur effects
- **Hyprpaper** - Wallpaper daemon
- **Network Manager** - Network management with nm-applet
- **Blueman** - Bluetooth management

## 🎨 Color Scheme

Dark theme with cyan/green gradient accents and blue highlights.

### Hyprland Colors
- **Active Border**: Gradient from `#33ccff` (cyan) to `#00ff99` (green) at 45°
- **Inactive Border**: `#595959aa` (gray with transparency)
- **Background**: `#1e1e1e` (dark)
- **Shadow**: `#1a1a1a` with blur

### Waybar Colors
- **Background**: Linear gradient from `rgba(30, 30, 30, 0.95)` to `rgba(20, 20, 30, 0.95)`
- **Border**: Gradient from `#33ccff` (cyan) to `#00ff99` (green)
- **Active Workspace**: Gradient `#33ccff` to `#00ff99`
- **Window Title**: `#33ccff` (cyan)
- **Clock**: `#33ccff` with semi-transparent background
- **Module Colors**:
  - CPU: `#ff9d66` (orange)
  - Memory: `#a89dff` (purple)
  - Disk: `#ffd966` (yellow)
  - Network: `#33ccff` (cyan)
  - Audio: `#00ff99` (green)
  - Battery: `#88ff88` (light green)
  - Power: `#ff6b6b` (red)

### Wofi Colors
- **Background**: `rgba(30, 30, 30, 0.95)`
- **Border**: `#5f87ff` (blue)
- **Selected**: `#5f87ff` (blue)
- **Input Field**: `rgba(50, 50, 50, 0.8)`

### Dunst Colors
- **Background**: `#1e1e1e`
- **Foreground**: `#ffffff`
- **Frame**: `#5f87ff` (blue)
- **Separator**: `#4c4c4c`

## 🚀 Installation

### Prerequisites
- Arch Linux or Arch-based distribution
- `yay` AUR helper (script will install if needed)

### Quick Setup

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. **Install packages**
```bash
chmod +x packages.sh
./packages.sh
```

This will install:
- Hyprland ecosystem (hyprland, hyprpaper, hyprlock, hypridle, hyprpicker)
- Terminal & shell (kitty)
- UI components (waybar, wofi, wlogout, dunst)
- Text editor (neovim)
- Clipboard tools (cliphist, wl-clipboard, wtype)
- File manager (thunar with plugins)
- Media tools (pipewire, pavucontrol, playerctl)
- Utilities (brightnessctl, grim, slurp, imv)
- Network & Bluetooth (NetworkManager, bluez, blueman)
- Fonts (JetBrains Mono Nerd Font, Font Awesome, Noto)

3. **Set up configurations**
```bash
chmod +x setup-dotfiles.sh
./setup-dotfiles.sh
```

This script:
- Backs up existing configs in `~/.config/` as `.backup`
- Creates symlinks from `~/.config/` to `~/dotfiles/`
- Makes scripts executable

**Note**: The actual configuration files are stored in `~/dotfiles/` (version controlled), and symlinks are created in `~/.config/` pointing to them.

4. **Set up wallpaper**
```bash
# Place your wallpaper at:
mkdir -p ~/Pictures
cp your-wallpaper.jpg ~/Pictures/wallpaper.jpg

# Or for hyprlock:
cp your-wallpaper.jpg ~/Wallpapers/wall.jpg
```

5. **Log out and select Hyprland** from your display manager

## ⌨️ Keybindings

### Core Applications
- `SUPER + Q` - Terminal (kitty)
- `SUPER + C` - Close window
- `SUPER + M` - Exit Hyprland
- `SUPER + E` - File manager (dolphin)
- `SUPER + D` - App launcher (wofi --show drun)
- `SUPER + R` - Run menu (wofi --show run)
- `SUPER + L` - Lock screen (hyprlock)

### Window Management
- `SUPER + F` - Fullscreen toggle
- `SUPER + V` - Toggle floating
- `SUPER + P` - Pseudo-tile
- `SUPER + J` - Toggle split
- `SUPER + Arrow Keys` - Move focus
- `ALT + Tab` - Cycle to next window
- `ALT + SHIFT + Tab` - Cycle to previous window

### Workspaces
- `SUPER + 1-9/0` - Switch to workspace 1-10
- `SUPER + SHIFT + 1-9/0` - Move window to workspace 1-10
- `SUPER + S` - Toggle special workspace (scratchpad)
- `SUPER + SHIFT + S` - Move window to special workspace
- `SUPER + Mouse_Scroll` - Switch workspace

### Window Interaction
- `SUPER + Left Mouse` - Move window
- `SUPER + Right Mouse` - Resize window

### Media Controls
- `XF86AudioRaiseVolume` - Volume up 5% (using wpctl)
- `XF86AudioLowerVolume` - Volume down 5%
- `XF86AudioMute` - Mute toggle
- `XF86AudioMicMute` - Mic mute toggle
- `XF86MonBrightnessUp` - Brightness up 5%
- `XF86MonBrightnessDown` - Brightness down 5%
- `XF86AudioNext` - Next track (playerctl)
- `XF86AudioPrev` - Previous track
- `XF86AudioPlay/Pause` - Play/pause

### Utilities
- `SUPER + SHIFT + V` - Clipboard history (cliphist with wofi)

### Power Management
- `SUPER + SHIFT + L` - Lock screen
- `SUPER + SHIFT + E` - Logout menu (wlogout)
- `SUPER + SHIFT + P` - Power off
- `SUPER + SHIFT + R` - Reboot
- `SUPER + SHIFT + Z` - Suspend

## 🎯 Features

### Animations
- Custom bezier curves for fluid transitions:
  - `easeOutQuint` - Smooth window movements
  - `easeInOutCubic` - Balanced animations
  - `quick` - Snappy responses
  - `almostLinear` - Fade effects
- Animated window pop-in/out (87% scale)
- Smooth workspace transitions with fade
- Gradient border animations

### Visual Effects
- **Window Borders**: Animated 45° gradient (cyan → green)
- **Blur**: Size 3, 1 pass, vibrancy 0.1696
- **Rounding**: 10px corners with power 2
- **Shadows**: 4px range with high render quality
- **Gaps**: 5px inner, 20px outer
- **Opacity**: Full opacity (1.0) for both active and inactive windows

### Waybar Modules
- **Workspaces**: Custom icons with gradient active state
- **Window Title**: Shows current window with styling
- **Clock**: Date and time with calendar tooltip
- **System Monitoring**: CPU, Memory, Disk usage
- **Network**: WiFi/Ethernet status with connection editor
- **Audio**: Volume control with pavucontrol
- **Battery**: Status with charging/warning indicators
- **System Tray**: For background applications
- **Power Menu**: Launches wlogout

### Power Management (Wlogout)
Six power options with keyboard shortcuts:
- **Lock** (L) - Screen lock with hyprlock
- **Hibernate** (H) - Hibernate system
- **Logout** (E) - Exit Hyprland session
- **Shutdown** (S) - Power off
- **Suspend** (U) - Suspend to RAM
- **Reboot** (R) - Restart system

### Clipboard Management
- Persistent clipboard history with cliphist
- Auto-start on login (wl-paste watch)
- Wofi integration for easy selection
- Auto-paste capability with wtype

### Notifications (Dunst)
- Top-right placement with 10px offset
- 300px width, rounded 10px corners
- Blue frame (#5f87ff) with 2px border
- Progress bar support
- 20 notification history
- Click actions: left=close, right=close all

### Auto-start Services
- Dunst (notifications)
- Hyprpaper (wallpaper)
- Waybar (status bar)
- Network Manager Applet
- Blueman Applet (Bluetooth)
- Clipboard manager (cliphist)

## 🔧 Customization

### General Settings
Edit `~/dotfiles/hypr/hyprland.conf`:
- **Gaps**: Lines 39-40 (`gaps_in`, `gaps_out`)
- **Border size**: Line 41 (`border_size`)
- **Border colors**: Lines 43-44 (gradient angle and colors)
- **Rounding**: Lines 52-53
- **Blur**: Lines 65-70 (size, passes, vibrancy)
- **Animations**: Lines 73-98 (timing, bezier curves)

### Applications
Edit program variables (lines 10-12):
- `$terminal` - Default terminal
- `$fileManager` - Default file manager  
- `$menu` - Default application launcher

### Waybar Customization
- **Layout**: `~/dotfiles/waybar/config` - Add/remove modules
- **Styling**: `~/dotfiles/waybar/style.css` - Colors, fonts, spacing
- **Module colors**: Lines 91-167 for individual module styling

### Wofi Launcher
- **Settings**: `~/dotfiles/wofi/config` - Size, location, behavior
- **Theme**: `~/dotfiles/wofi/style.css` - Colors and effects

### Wallpaper
- **Hyprpaper**: Edit `~/dotfiles/hypr/hyprpaper.conf`
  - Change path: Line 1 (preload) and Line 2 (wallpaper)
- **Hyprlock**: Edit `~/dotfiles/hypr/hyprlock.conf`
  - Change path: Line 10 (background path)

### Notifications
Edit `~/dotfiles/dunst/dunstrc`:
- **Position**: Line 12 (`origin`)
- **Offset**: Line 13 (`offset`)
- **Colors**: Lines 32-35 (background, foreground, frame)
- **Font**: Line 46

### Keyboard Layout
Edit `~/dotfiles/hypr/hyprland.conf` line 120:
- Change `kb_layout = us` to your layout (e.g., `gb`, `de`, `fr`)

### Touchpad
Edit `~/dotfiles/hypr/hyprland.conf` lines 124-126:
- `natural_scroll` - Enable/disable natural scrolling

All configs are stored in `~/dotfiles/` with symlinks from `~/.config/` - edit files in `~/dotfiles/` to make changes.
Reload Hyprland with `hyprctl reload` or `SUPER + M` (exit) and re-login.

## 📁 File Structure

```
dotfiles/
├── hypr/                    # Hyprland configuration
│   ├── hyprland.conf       # Main config: keybinds, animations, appearance
│   ├── hyprlock.conf       # Lock screen config
│   └── hyprpaper.conf      # Wallpaper config
├── waybar/                  # Status bar
│   ├── config              # Module configuration
│   ├── config.bak          # Backup config
│   ├── style.css           # Styling and colors
│   └── scripts/            # Custom scripts directory
├── wofi/                    # Application launcher
│   ├── config              # Launcher settings
│   └── style.css           # Theme and styling
├── wlogout/                 # Logout menu
│   ├── layout              # Menu options and actions
│   └── style.css           # Menu styling
├── dunst/                   # Notification daemon
│   └── dunstrc             # Notification config
├── kitty/                   # Terminal emulator
│   ├── kitty.conf          # Main terminal config
│   ├── kitty.conf.bak      # Backup config
│   └── current-theme.conf  # Color theme
├── nvim/                    # Neovim editor
│   ├── init.lua            # Main configuration
│   └── lazy-lock.json      # Plugin lockfile
├── scripts/                 # Utility scripts
│   └── cliphist.sh         # Clipboard manager script
├── packages.sh              # Package installation script
├── setup-dotfiles.sh        # Dotfiles setup and symlink script
├── fix-structure.sh         # Structure migration script (one-time use)
└── README.md                # This file
```

**Structure**: Configuration files are stored in `~/dotfiles/` (git repository). Running `setup-dotfiles.sh` creates symlinks from `~/.config/{config}` → `~/dotfiles/{config}`, allowing you to version control your dotfiles while keeping them in the standard config location.

## 📝 Notes

- **Automated Setup**: Use `packages.sh` to install all dependencies and `setup-dotfiles.sh` to configure
- **Symlink Structure**: Actual configs are in `~/dotfiles/` (git repo), symlinks in `~/.config/` point to them
- **Backup Protection**: Existing configs are backed up as `.backup` before setup
- **Live Changes**: Edit files in `~/dotfiles/` and changes apply immediately via symlinks
- **Clipboard History**: Starts automatically on login and runs in background
- **Wallpaper Paths**: 
  - Hyprpaper: `~/Pictures/wallpaper.jpg`
  - Hyprlock: `~/Wallpapers/wall.jpg`
- **File Manager**: Default is Dolphin (KDE), but Thunar is installed by packages.sh
- **Font Required**: JetBrains Mono Nerd Font for icons in Waybar
- **Audio System**: Uses PipeWire with wpctl for volume control
- **Display Manager**: Select "Hyprland" from your login screen after installation
- **Reload Config**: Use `hyprctl reload` to apply Hyprland changes without re-login

## 🐛 Troubleshooting

### Waybar not showing icons
```bash
# Install required fonts
yay -S ttf-jetbrains-mono-nerd ttf-font-awesome
```

### Clipboard history not working
```bash
# Manually start clipboard manager
wl-paste --watch cliphist store &
```

### Wallpaper not loading
```bash
# Check paths in configs
cat ~/dotfiles/hypr/hyprpaper.conf
# Make sure wallpaper exists at specified path
ls -l ~/Pictures/wallpaper.jpg
```

### Bluetooth/Network icons missing
```bash
# Start applets manually
nm-applet &
blueman-applet &
```

## 🔄 Updating

```bash
cd ~/dotfiles
git pull
# Reload Hyprland
hyprctl reload
```

## 📦 Dependencies Summary

**Core**: hyprland, hyprpaper, hyprlock, hypridle, hyprpicker  
**UI**: waybar, wofi, wlogout, dunst  
**Terminal**: kitty  
**Editor**: neovim  
**Utilities**: cliphist, wl-clipboard, wtype, grim, slurp, brightnessctl  
**Audio**: pipewire, pipewire-pulse, pavucontrol, playerctl  
**System**: NetworkManager, bluez, blueman  
**Fonts**: ttf-jetbrains-mono-nerd, ttf-font-awesome, noto-fonts

See `packages.sh` for complete package list.

