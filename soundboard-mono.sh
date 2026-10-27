#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${REPO_DIR:-$HOME/Projects/Linux-SoundBoard}"
INSTALL_DIR="$HOME/.local/opt/linux-soundboard-mono"
DESKTOP_DIR="$HOME/.local/share/applications"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

PKG_INFO="$(pacman -Q linux-soundboard)"
PKG_VER="${PKG_INFO#* }"
PKG_VER="${PKG_VER%-*}"
TAG="v${PKG_VER}"

if [ -d "$REPO_DIR/.git" ]; then
    git -C "$REPO_DIR" fetch --tags --quiet
    git -C "$REPO_DIR" checkout --quiet -- src/themes/dark.css
else
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone https://github.com/germanua/Linux-SoundBoard "$REPO_DIR"
fi

git -C "$REPO_DIR" checkout --quiet "$TAG"
git -C "$REPO_DIR" checkout --quiet -- src/themes/dark.css
cd "$REPO_DIR"

cat > "$WORK_DIR/recolor.sed" <<SED_EOF
s/@define-color accent_fg_color #DFD0B8;/@define-color accent_fg_color #151515;/I
s/linear-gradient(90deg, #948979, #dfd0b8)/linear-gradient(90deg, #8a8a8a, #f0f0f0)/I
s/#222831/#151515/gI
s/#202832/#1a1a1a/gI
s/#2d3139/#1e1e1e/gI
s/#262c36/#181818/gI
s/#393e46/#242424/gI
s/#383f49/#202020/gI
s/#4b5158/#3a3a3a/gI
s/rgba(34, 40, 49,/rgba(21, 21, 21,/g
s/rgba(9, 12, 16,/rgba(6, 6, 6,/g
s/#dfd0b8/#f0f0f0/gI
s/rgba(223, 208, 184,/rgba(240, 240, 240,/g
s/#f2e7d5/#151515/gI
s/#1a1614/#151515/gI
s/#a39887/#e6e6e6/gI
s/#847866/#a8a8a8/gI
s/#948979/#cfcfcf/gI
s/rgba(148, 137, 121,/rgba(207, 207, 207,/g
s/#d98d7a/#ffffff/gI
s/rgba(217, 141, 122,/rgba(255, 255, 255,/g
s/rgba(220, 120, 0,/rgba(235, 235, 235,/g
s/rgba(196, 90, 90,/rgba(255, 255, 255,/g
SED_EOF

sed -i -f "$WORK_DIR/recolor.sed" src/themes/dark.css

cat >> src/themes/dark.css <<CSS_EOF

.transport-bar scale slider,
scale.volume-slider slider {
  border-color: #8a8a8a;
}

.playing-dot,
.list-style-card .playing-dot {
  color: #ffffff;
}

.sound-cell-first.sound-cell-playing {
  border-left-color: rgba(255, 255, 255, 0.8);
}

columnview.list-style-card row > cell:first-child.sound-cell-playing {
  border-left-color: #ffffff;
}
CSS_EOF

rustup toolchain install
cargo build --release

mkdir -p "$INSTALL_DIR"
install -m 755 target/release/linux-soundboard "$INSTALL_DIR/linux-soundboard"

mkdir -p "$DESKTOP_DIR"
SYS_DESKTOP=""
for candidate in /usr/share/applications/*oundboard*.desktop; do
    [ -e "$candidate" ] && SYS_DESKTOP="$candidate" && break
done

if [ -n "$SYS_DESKTOP" ]; then
    TARGET="$DESKTOP_DIR/$(basename "$SYS_DESKTOP")"
    sed -e "s|^Exec=.*|Exec=$INSTALL_DIR/linux-soundboard|" \
        -e '/^TryExec=/d' \
        -e '/^DBusActivatable=/d' \
        "$SYS_DESKTOP" > "$TARGET"
else
    cat > "$DESKTOP_DIR/linux-soundboard-mono.desktop" <<DESKTOP_EOF
[Desktop Entry]
Name=Linux Soundboard (mono)
Exec=$INSTALL_DIR/linux-soundboard
Icon=linux-soundboard
Type=Application
Categories=AudioVideo;Audio;
DESKTOP_EOF
fi

command -v update-desktop-database >/dev/null && update-desktop-database "$DESKTOP_DIR" || true
