<div align="center">

# 🎨 Soundboard Mono

### Monochrome theme for Linux SoundBoard

A small theme script for [Linux SoundBoard](https://github.com/germanua/Linux-SoundBoard), made for Arch-based Linux distributions.

[![Platform](https://img.shields.io/badge/platform-Arch%20based-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Theme](https://img.shields.io/badge/theme-monochrome-333333)](https://github.com/FavnyWasTaken/Soundboard-mono)

</div>

> [!WARNING]
> This script is intended for Arch-based distributions. It does not work on Windows or non-Arch distributions. Review the script before running it, especially if you use the `curl | bash` installation method.

## 🚀 Installation

### Quick install

If you already have `paru` installed:

```bash
paru -S linux-soundboard
curl -fsSL https://raw.githubusercontent.com/FavnyWasTaken/Soundboard-mono/main/soundboard-mono.sh | bash
```

If you do not have `paru` yet, install it first using a method supported by your system.

### Manual install

Install the required packages, clone the repository, and run the script:

```bash
sudo pacman -S --needed git rustup pkgconf clang gtk4 libadwaita libpulse opus libx11 libxi pipewire pipewire-pulse wireplumber
paru -S --needed linux-soundboard
git clone https://github.com/FavnyWasTaken/Soundboard-mono.git
cd Soundboard-mono
bash soundboard-mono.sh
```

## ⌨️ Hyprland customization

To open Linux SoundBoard with this theme from a Hyprland keybind, use the themed application path:

```text
/home/USER/.local/opt/linux-soundboard-mono/linux-soundboard
```

Replace `USER` with your Linux username and use this path in your Hyprland bind.

## 🛠️ Troubleshooting

### The script does not work on CachyOS, Omarchy, or EndeavourOS

Make sure the required packages are installed:

```bash
sudo pacman -S --needed git rustup pkgconf clang gtk4 libadwaita libpulse opus libx11 libxi pipewire pipewire-pulse
```

Then try running the installation script again.

## 📦 Support

This is a small personal project made primarily for my custom dotfiles and friends. It is intended for Arch-based distributions; other distributions, such as Gentoo or NixOS, are not supported.

I do not plan to maintain it regularly or add more color schemes. If you want a different color, you can edit the color values in `soundboard-mono.sh`.

## 🙏 Credits

- [germanua/Linux-SoundBoard](https://github.com/germanua/Linux-SoundBoard) — the application this theme is made for

## 🔗 Related

This theme was originally made for my custom dotfiles. You can also check out [my-dots](https://github.com/FavnyWasTaken/my-dots).

