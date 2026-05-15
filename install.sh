#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_SCRIPT="$HOME/select_host.sh"
BASHRC="$HOME/.bashrc"
SSH_DIR="$HOME/.ssh"
SSH_CONFIG="$SSH_DIR/config"
MARKER_BEGIN="# >>> simple-homelab-jumphost >>>"
MARKER_END="# <<< simple-homelab-jumphost <<<"

echo "Installing simple-homelab-jumphost..."

if ! command -v fzf >/dev/null 2>&1; then
    echo "WARNING: fzf not found on PATH. Install it before connecting, e.g.:"
    echo "  Debian/Ubuntu: sudo apt install fzf"
    echo "  Fedora:        sudo dnf install fzf"
    echo "  Arch:          sudo pacman -S fzf"
fi

install -m 0755 "$SCRIPT_DIR/select_host.sh" "$TARGET_SCRIPT"
echo "Installed $TARGET_SCRIPT"

if grep -qF "$MARKER_BEGIN" "$BASHRC" 2>/dev/null; then
    echo "Skipped $BASHRC — already contains the jumphost snippet"
else
    {
        printf '\n%s\n' "$MARKER_BEGIN"
        cat "$SCRIPT_DIR/bashrc"
        printf '%s\n' "$MARKER_END"
    } >> "$BASHRC"
    echo "Appended jumphost snippet to $BASHRC"
fi

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"
if [[ -e "$SSH_CONFIG" ]]; then
    echo "Skipped $SSH_CONFIG — file already exists. Merge entries from $SCRIPT_DIR/ssh/config manually."
else
    install -m 0600 "$SCRIPT_DIR/ssh/config" "$SSH_CONFIG"
    echo "Installed sample $SSH_CONFIG — edit it with your own hosts"
fi

echo
echo "Done. Open a fresh SSH session to this host to test the menu."
