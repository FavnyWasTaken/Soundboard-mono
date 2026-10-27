Sup everyone who read this text, it's script made for https://github.com/germanua/Linux-SoundBoard , if u use this script, u make u Linux Soundboard theme - monochrome. It's application and script does not work on Windows System or distributions other than Arch-Based.
So that's it, How to actually apply it:
sudo pacman -S paru (if you havent already installed)
paru -S linux-soundboard
curl -fsSL https://raw.githubusercontent.com/FavnyWasTaken/Soundboard-mono/main/soundboard-mono.sh | bash

Or if u want on your own use:
sudo pacman -S --needed git rustup pkgconf clang gtk4 libadwaita libpulse opus libx11 libxi pipewire pipewire-pulse wireplumber
paru -S --needed linux-soundboard
git clone https://github.com/FavnyWasTaken/Soundboard-mono.git
cd Soundboard-mono
bash soundboard-mono.sh


If u use Hyprland binds for open linux-soundboard, add this path to u bind, so that it opens with the color you want:
"/home/USER/.local/opt/linux-soundboard-mono/linux-soundboard"

Popular-frequent question: Why this script does not work in my CachyOS/Omarchy/EndeavourOS?
If the script does not work, install all the necessary packages:
sudo pacman -S --needed git rustup pkgconf clang gtk4 libadwaita libpulse opus libx11 libxi pipewire pipewire-pulse

(I will repeat, it's commands and guide for Arch based distros, if u have other distros for example Ubuntu or Gentoo, it does not work on distributions other than Arch-Based)

(This is not some big popular project, or a project that I will often update/maintain and add new color schemes, this is more of a project for me and my friends, if you need a different color scheme, then you can replace it in the file itself (Soundboard-mono.sh) the color codes with others that you need.)
