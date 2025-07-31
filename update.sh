#!/usr/bin/env bash

set -e

INSTALL_DIR="/opt/cursor"
APPIMAGE="$INSTALL_DIR/cursor.AppImage"

echo "🔹 Updating Cursor IDE..."

LATEST_URL=$(wget -qO- https://api.github.com/repos/getcursor/cursor/releases/latest | grep browser_download_url | grep AppImage | cut -d '"' -f 4 | head -n 1)

if [[ -z "$LATEST_URL" ]]; then
    echo "❌ Failed to fetch latest Cursor release URL."
    exit 1
fi

sudo wget -O "$APPIMAGE" "$LATEST_URL"
sudo chmod +x "$APPIMAGE"

echo "✅ Cursor IDE updated to the latest version!"
