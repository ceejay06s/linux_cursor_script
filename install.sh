#!/usr/bin/env bash

set -e

INSTALL_DIR="/opt/cursor"
APPIMAGE="$INSTALL_DIR/cursor.AppImage"
DESKTOP_FILE="/usr/share/applications/cursor.desktop"

echo "🔹 Installing Cursor IDE..."

# Install required dependency
sudo apt update
sudo apt install -y libfuse2 wget

# Create install directory
sudo mkdir -p "$INSTALL_DIR"

# Get latest Cursor release URL
LATEST_URL=$(wget -qO- https://api.github.com/repos/getcursor/cursor/releases/latest | grep browser_download_url | grep AppImage | cut -d '"' -f 4 | head -n 1)

if [[ -z "$LATEST_URL" ]]; then
    echo "❌ Failed to fetch latest Cursor release URL."
    exit 1
fi

echo "Downloading Cursor from: $LATEST_URL"
sudo wget -O "$APPIMAGE" "$LATEST_URL"
sudo chmod +x "$APPIMAGE"

# Create desktop shortcut
sudo tee "$DESKTOP_FILE" >/dev/null <<EOF
[Desktop Entry]
Name=Cursor IDE
Exec=$APPIMAGE --no-sandbox
Icon=$INSTALL_DIR/icon.png
Type=Application
Categories=Development;IDE;
EOF

# Download icon (optional)
ICON_URL="https://raw.githubusercontent.com/getcursor/cursor/main/assets/icon.png"
sudo wget -O "$INSTALL_DIR/icon.png" "$ICON_URL" || true

# Add command to /usr/local/bin
sudo ln -sf "$APPIMAGE" /usr/local/bin/cursor

echo "✅ Cursor IDE installed successfully!"
echo "Run it via: cursor"
