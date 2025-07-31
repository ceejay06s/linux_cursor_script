#!/usr/bin/env bash

set -e

INSTALL_DIR="/opt/cursor"
DESKTOP_FILE="/usr/share/applications/cursor.desktop"

echo "🔹 Uninstalling Cursor IDE..."

# Remove files
sudo rm -rf "$INSTALL_DIR"
sudo rm -f "$DESKTOP_FILE"
sudo rm -f /usr/local/bin/cursor

echo "✅ Cursor IDE uninstalled successfully!"
