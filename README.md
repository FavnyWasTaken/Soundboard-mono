Hello everyone who read this text, it's script made for https://github.com/germanua/Linux-SoundBoard , if u use this script, u make u Linux Soundboard theme - monochrome.
So that's it, How to actually apply it:
curl -fsSL https://raw.githubusercontent.com/FavnyWasTaken/Soundboard-mono/main/soundboard-mono.sh | bash

Or if u want on your own use:
sudo pacman -S --needed git rustup pkgconf clang gtk4 libadwaita libpulse opus libx11 libxi pipewire pipewire-pulse wireplumber
paru -S --needed linux-soundboard
git clone https://github.com/FavnyWasTaken/Soundboard-mono.git
cd Soundboard-mono
bash soundboard-mono.sh

(It's command for Arch based distros, If you are using another distribution, please look for your distribution team)
