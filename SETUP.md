# Setup Instructions

## Installation Required

First, install the required packages:

```bash
yay -S cliphist wlogout
```

## What's Configured

### 1. ✅ Wofi (App Launcher)
- **Config**: `~/.config/wofi/config`
- **Style**: `~/.config/wofi/style.css`
- **Keybind**: `SUPER + D` (already works)

### 2. ✅ Wlogout (Logout Menu)
- **Layout**: `~/.config/wlogout/layout`
- **Style**: `~/.config/wlogout/style.css`
- **Keybind**: `SUPER + SHIFT + E`
- **Options**: Lock, Logout, Suspend, Hibernate, Reboot, Shutdown

### 3. ✅ Cliphist (Clipboard Manager)
- **Script**: `~/dotfiles/scripts/cliphist.sh`
- **Keybind**: `SUPER + SHIFT + V` - Show clipboard history
- **Autostart**: Clipboard monitoring starts automatically

### 4. ✅ Color Scheme
- **File**: `~/dotfiles/colors.conf`
- **Theme**: Nord-inspired dark with cyan/green accents
- **Applied to**: Hyprland borders, animations, and configs

### 5. ✅ Keybindings Documentation
- **File**: `~/dotfiles/KEYBINDINGS.md`
- **Contains**: All keyboard shortcuts organized by category

## After Installation

1. **Install packages**:
   ```bash
   yay -S cliphist wlogout
   ```

2. **Reload Hyprland**:
   ```bash
   hyprctl reload
   ```
   Or press `SUPER + SHIFT + R` (reload config)

3. **Test the features**:
   - `SUPER + SHIFT + E` - Open wlogout menu
   - `SUPER + SHIFT + V` - Open clipboard history (after copying something)
   - `SUPER + D` - Open wofi with new config

## Customization

- **Colors**: Edit `~/dotfiles/colors.conf` and apply to other configs
- **Borders/Gaps**: Edit `hypr/hyprland.conf` general section (lines 37-48)
- **Animations**: Edit `hypr/hyprland.conf` animations section (lines 72-98)
- **Rounding**: Currently set to 10px (line 51)

All configs are symlinked, so editing in `~/dotfiles/` applies changes immediately!
