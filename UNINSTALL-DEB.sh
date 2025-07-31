#!/bin/bash

echo "❌ Uninstalling Cursor IDE..."
sudo apt remove --purge cursor -y || echo "⚠️ Package 'cursor' not found in apt. Trying manually..."

# Try manual removal
sudo rm -rf /opt/Cursor /usr/share/applications/cursor.desktop ~/.config/Cursor ~/.local/share/cursor

echo "🧹 Cleaning up..."
sudo apt autoremove -y

echo "✅ Cursor IDE uninstalled."
